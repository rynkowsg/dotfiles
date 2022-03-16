(ns onedrive-filenames-correction
  (:require
   [babashka.fs :as bfs]
   [clojure.string :as str]
   [clojure.pprint]
   [malli.core :as m]
   [piotr-yuxuan.malli-cli.malli-cli :refer [summary] :as malli-cli]
   [piotr-yuxuan.malli-cli.utils :refer [deep-merge]]))

(defn correct-name?
  [name]
  (some? (re-matches #"[^<>\"?]*" name)))
#_(correct-name? "220214-1 Direct Debit Confirmation - Virgin Media - Virgin Media <webteam@virginmedia.com> - 2022-02-14 0904")
#_(correct-name? "220214-1 Direct Debit Confirmation - Virgin Media - Virgin Media _webteam@virginmedia.com_ - 2022-02-14 0904")
#_(correct-name? "220119-1 New Year’s resolutions to start investing in 2022?  - 'DEGIRO' _no-reply@mail.degiro.com_ - 2022-01-19 2104")

(defn correct-name
  [name]
  (-> name
      (str/replace #"\"" "'")
      (str/replace #"[<>?]" "_")))
#_(correct-name "220214-1 Direct Debit Confirmation - Virgin Media - Virgin Media <webteam@virginmedia.com> - 2022-02-14 0904")
#_(correct-name "220119-1 New Year’s resolutions to start investing in 2022?  - 'DEGIRO' _no-reply@mail.degiro.com_ - 2022-01-19 2104")

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
#_(find-incorrect-names "/Users/greg/OneDrive/Events-Private/actions-online/2022-02-12 - VirginMedia - Change DD to Monzo/")

(defn correct-incorrect-names!
  ([dir] (correct-incorrect-names! dir nil))
  ([dir opts]
   #_(run! #(correct-name! % opts) (find-incorrect-names dir))
   (doseq [f (find-incorrect-names dir)]
     (correct-name! f opts))))

(comment
 (correct-incorrect-names! "/Users/greg/OneDrive" {:dry-run true})
 (correct-incorrect-names! "/Users/greg/OneDrive/Events-Private/actions-online/2022-02-12 - VirginMedia - Change DD to Monzo/" {:dry-run true}))

(def Config
  (let [default-root (format "%s/OneDrive" (System/getenv "HOME"))]
    (m/schema
     [:map {:closed true, :decode/args-transformer malli-cli/args-transformer}
      [:root
       [string? {:description "OneDrive root directory"
                 :short-option "-r"
                 :arg-number 1
                 :default default-root
                 :optional true}]]
      [:dry-run {:optional true}
       [boolean? {:description "Run but do not apply changes."
                  :short-option "-d"
                  :arg-number 0
                  :default false}]]
      [:show-config? {:optional true}
       [boolean? {:description "Print actual configuration value and exit."
                  :arg-number 0}]]
      [:help {:optional true}
       [boolean? {:description "Display usage summary and exit."
                  :short-option "-h"
                  :arg-number 0}]]])))

(defn load-config
  [args]
  (deep-merge
   ;; Value retrieved from any configuration system you want
   (:value {:dir "/Users/greg/OneDrive"})
   ;; Command-line arguments, env-vars, and default values.
   (as-> args $
         (m/decode Config $ malli-cli/cli-transformer))))
#_ (load-config ["--show-config"])
#_(m/explain Config (load-config ["-h"]))

(defn -main
  [& args]
  (let [config (load-config args)]
    (cond (not (m/validate Config config))
          (do (println "Invalid configuration value")
              (clojure.pprint/pprint (m/explain Config config))
              (System/exit 1))

          (:show-config? config)
          (do (clojure.pprint/pprint config)
              (System/exit 0))

          (:help config)
          (do (println (summary Config))
              (System/exit 0))

          :else
          (let [opts (select-keys config [:dry-run])
                root (:root config)]
            (try
              (correct-incorrect-names! root opts)
              (catch Exception e
                (println e)))))))
