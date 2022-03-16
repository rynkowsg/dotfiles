#!/usr/bin/env bb

#?(:bb      (do (require '[babashka.deps])
                (babashka.deps/add-deps '{:deps {clj-commons/fs {:mvn/version "1.6.309"}}}))
   :default (do))

(ns update-latest-symlink
  (:require
   [clojure.string :as str]
   [babashka.fs :as bfs]
   [me.raynes.fs :as fs]))

(defn pick-latest [dir]
  (->> (bfs/list-dir dir)
       (filter #(not (str/ends-with? % "latest")))
       (sort)
       (last)))

(comment
 (bfs/create-sym-link "/tmp/latest" "/tmp/sample-target-file")
 (bfs/delete "/tmp/latest")
 (pick-latest "/usr/local/opt/android-sdk/build-tools"))

(defn create-symlink [path target]
  (bfs/create-sym-link path target)
  (println "[update-symlinks]   added" (str path) " => " (str target)))

(defn create-latest-in-dir [dir]
  (if (fs/exists? dir)
    (let [latest-one      (str (pick-latest dir))
          symlink-path    (bfs/file dir "latest")
          exists          (bfs/sym-link? symlink-path)
          previous-target (when exists (str (fs/read-sym-link symlink-path)))]
      (when (not exists)
        (create-symlink symlink-path latest-one))
      (when (and exists (not= previous-target latest-one))
        (bfs/delete symlink-path)
        (println "[update-symlinks] removed" (str symlink-path) " => " (str previous-target))
        (create-symlink symlink-path latest-one)))
    (println "[update-symlinks] directory doesn't exist:" dir)))

(let [dirs *command-line-args*]
  (run! create-latest-in-dir dirs))
