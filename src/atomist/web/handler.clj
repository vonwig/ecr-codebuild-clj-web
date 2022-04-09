(ns atomist.web.handler
  (:require [compojure.core :refer [defroutes GET]]
            [ring.adapter.jetty :refer [run-jetty]]
            [ring.middleware.json :refer [wrap-json-response wrap-json-body]]
            [compojure.route :as route]
            [cljc.java-time.local-date :as ld])
  (:gen-class))

(defroutes app
  (GET "/health" _ (constantly {:status 200 :body "ok"}))
  (->
   (GET "/" _ (constantly {:status 200 :body {:hey "you" :version 44 :time (str (ld/now))}}))
   (wrap-json-body {:keywords? true :bigdecimals? true})  
   (wrap-json-response))
  (route/not-found "<h1>not found</h1>"))

(defn -main
  [& args]
  (try
    (println "... run-jetty with args" args)
    (run-jetty app {:port 3000})
    (catch Throwable t
      (println "failed to start " t))))

