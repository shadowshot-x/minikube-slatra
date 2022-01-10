#!bin/bash

minikube delete --all

# Start the K8 cluster.
minikube start

# Creating a Deployment
kubectl create deployment docker-deployment --image=nginx

# see configs state
minikube config

# change the container runtime
minikube config set container-runtime containerd

# see the changed values
minikube config get container-runtime

# restart the k8
minikube delete --all
minikube start

minikube config view