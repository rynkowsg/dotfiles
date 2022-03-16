#!/usr/bin/env bb

(require '[babashka.deps :as deps])
(deps/add-deps '{:deps {babashka/fs    {:mvn/version "0.1.4"}
                        clj-commons/fs {:mvn/version "1.6.309"}}})

(ns update-latest-symlink
  (:require
   [clojure.string :as str]
   [me.raynes.fs :as fs]))

(defn pick-latest [dir]
  (->> (fs/list-dir dir)
       (filter #(not (str/ends-with? % "latest")))
       (sort)
       (last)))

(comment
 (fs/delete symlink-path)
 (fs/sym-link symlink-path latest-build-tools)
 (pick-latest "/usr/local/opt/android-sdk/build-tools"))

(defn create-symlink [path target]
  (fs/sym-link path target)
  (println "[update-symlinks]   added" (str path) " => " (str target)))

(defn create-latest-in-dir [dir]
  (if (fs/exists? dir)
   (let [latest-one      (str (pick-latest dir))
         symlink-path    (fs/file dir "latest")
         exists          (fs/link? symlink-path)
         previous-target (when exists (str (fs/read-sym-link symlink-path)))]
     (when (not exists)
       (create-symlink symlink-path latest-one))
     (when (and exists (not= previous-target latest-one))
       (fs/delete symlink-path)
       (println "[update-symlinks] removed" (str symlink-path) " => " (str previous-target))
       (create-symlink symlink-path latest-one)))
   (println "[update-symlinks] directory doesn't exist:" dir)))

(let [dirs *command-line-args*]
  (run! create-latest-in-dir dirs))
