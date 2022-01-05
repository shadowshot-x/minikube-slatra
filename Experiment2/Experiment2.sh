#!bin/bash

# Delete the running instances from previous instances
minikube delete 

minikube start

# Set up frontend
kubectl create deployment frontend-deployment --image=shadowshotx/product-go-micro:latest --replicas=3

# Set up backend
kubectl create deployment backend-deployment --image=shadowshotx/product-go-micro:latest --replicas=2

# Look at the create service command
kubectl create service --help

# Set up a backend service of type ClusterIP
kubectl apply -f ./Experiment2/service-backend.yaml

# Set up a frontend service of type NodePort
kubectl apply -f ./Experiment2/service-frontend.yaml

# Check the services in the whole cluster
minikube service list

# Now, lets query the frontend from outside using curl. Note that NodePort may vary
curl 192.168.49.2:32534/ping

# Set up a frontend service of type LoadBalancer(simulated when K8 is in a cloud provider.)
# First we have to apply the Load balancer using minikube
minikube tunnel
kubectl apply -f ./Experiment2/service-frontend-lb.yaml

# Check the services again and query the frontend
minikube service list
curl 192.168.49.2:32519/ping

# Good, stop the tunnel using Ctrl-C

# Now lets check some internal communication using ClusterIP.
# As curl will not be installed in alpine base image containers, we will first install it.
kubectl exec frontend-deployment-7766588c6-2ksnh -it -- /bin/sh

# Now install curl on this (Remember this is an interactive terminal of the container)
apk --no-cache add curl

# Now, query for the backend-service
curl http://service-backend:81/ping

# Congratulations. Now you can query 

# Stop the minikube cluster.
minikube stop