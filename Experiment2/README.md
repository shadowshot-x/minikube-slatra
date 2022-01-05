# Experiment 2

Main aim of this Experiment is to play around with services. Some commands we will discover in this experiment include :- `minikube service`, `kubectl expose`, `minikube tunnel`.

1. Lets simulate a Minikube cluster with 1 Node, 3 pods of echoserver image(consider them as the frontend image) running using a Deployment. We want to first create a service of type NodePort. Then we want to access this using curl and chrome.

2. Next create another Deployment in same cluster with 2 pods of echoserver (consider them as backend). Next set up a Service of type LoadBalancer. Then we want to access these using curl and chrome.

