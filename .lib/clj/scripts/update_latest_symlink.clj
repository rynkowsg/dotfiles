#!/usr/bin/env bb

#?(:bb (do (require '[babashka.deps])
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
 (pick-latest "/home/user/.android/sdk/build-tools"))

(defn create-symlink [path target]
  (bfs/create-sym-link path target)
  (println "[update-symlinks]   added" (str path) " => " (str target)))

(defn create-latest [dir symlink-path]
  (if (not (fs/exists? dir))
    (println "[update-symlinks] directory doesn't exist:" dir)
    (let [latest-one (str (pick-latest dir))
          exists (bfs/sym-link? symlink-path)
          previous-target (when exists (str (fs/read-sym-link symlink-path)))]
      (when (not exists)
        (create-symlink symlink-path latest-one))
      (when (and exists (not= previous-target latest-one))
        (bfs/delete symlink-path)
        (println "[update-symlinks] reset" (str symlink-path) " => " (str previous-target))
        (create-symlink symlink-path latest-one)))))

(let [[dir path] *command-line-args*]
  (create-latest dir path))
