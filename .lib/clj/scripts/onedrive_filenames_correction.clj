(ns onedrive-filenames-correction
  (:require
   [babashka.fs :as bfs]
   [clojure.string :as str]
   [clojure.pprint :refer [pprint]]
   [malli.core :as m]
   [piotr-yuxuan.malli-cli :refer [summary] :as malli-cli]))

(defn correct-name?
  [name]
  (some? (re-matches #"[^<>\"?|*/:]*" name)))
#_(correct-name? "220214-1 Email Title? <webteam@hello.com> - 2022-02-14 0904")
#_(correct-name? "220214-1 Email Title_ _webteam@hello.com_ - 2022-02-14 0904")
#_(correct-name? "220514-1 You paid £923.10 to Paypal *star Labs")
#_(correct-name? "Proceeds - Overview, Gross/Net Proceeds, How to Record.webloc")

(defn correct-name
  [name]
  (-> name
      (str/replace #"\"" "'")
      (str/replace #"[<>?|*/:]" "_")))
#_(correct-name "220214-1 Email Title? <webteam@hello.com> - 2022-02-14 0904")
#_(correct-name "220514-1 You paid £923.10 to Paypal *star Labs")
#_(correct-name "Proceeds - Overview, Gross/Net Proceeds, How to Record.webloc")

(defn correct-name!
  ([path] (correct-name! path nil))
  ([path {:keys [dry-run]}]
   (let [filename     (bfs/file-name path)
         new-filename (correct-name filename)
         new-path     (bfs/file (bfs/parent path) new-filename)]
     (if (bfs/exists? new-path)
       (println (format "SKIPPED \"%s\" - EXISTS: \"%s\"" path new-path))
       (do
         (when (not dry-run) (bfs/move path new-path))
         (println (format "CORRECTED \"%s\"" path)))))))

(defn find-incorrect-names
  [dir]
  (let [found    (atom '())
        visit-fn (fn [f _attr]
                   (let [filename (.toString (bfs/file-name f))]
                     (when (not (correct-name? filename))
                       (swap! found conj f)))
                   :continue)]
    (bfs/walk-file-tree dir {:visit-file    visit-fn
                             :pre-visit-dir visit-fn})
    @found))
#_(find-incorrect-names "/Users/greg/OneDrive")

(defn correct-incorrect-names!
  ([dir] (correct-incorrect-names! dir nil))
  ([dir opts]
   (run! #(correct-name! % opts) (find-incorrect-names dir))))

(comment
 (correct-incorrect-names! "/Users/greg/OneDrive" {:dry-run true}))

(def Config
  (let [default-root (format "%s/OneDrive" (System/getenv "HOME"))]
    (m/schema
     [:map {:closed true, :decode/args-transformer malli-cli/args-transformer}
      [:root
       [:string {:description  "OneDrive root directory"
                 :short-option "-r"
                 :arg-number   1
                 :default      default-root
                 :optional     true}]]
      [:dry-run
       [:boolean {:description  "Run but do not apply changes."
                  :short-option "-d"
                  :arg-number   0
                  :default      false}]]
      [:show-config?
       [:boolean {:description "Print actual configuration value and exit."
                  :arg-number  0
                  :optional    true
                  :default     false}]]
      [:help
       [:boolean {:description  "Display usage summary and exit."
                  :short-option "-h"
                  :arg-number   0
                  :optional     true
                  :default      false}]]])))

(defn load-config
  [args]
  (m/decode Config args malli-cli/cli-transformer))
#_(load-config ["--show-config"])
#_(m/explain Config (load-config [""]))

(defn -main
  [& args]
  (let [config (load-config args)]
    (cond (not (m/validate Config config))
          (do (println "Invalid configuration value")
              (pprint (m/explain Config config))
              (System/exit 1))

          (:show-config? config)
          (do (pprint config)
              (System/exit 0))

          (:help config)
          (do (println (summary Config))
              (System/exit 0))

          :else
          (let [opts (select-keys config [:dry-run])
                root (:root config)]
            (correct-incorrect-names! root opts)))))
