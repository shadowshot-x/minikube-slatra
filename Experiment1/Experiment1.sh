#!bin/bash

minikube start

# Get everything in all namespaces in JSON
kubectl get all --all-namespaces -o wide

# Get pods running in control plane
kubectl get pods -n kube-system -o wide

# Get Deployments running in control plane
kubectl get deployments -n kube-system -o wide

#Create Own Deployment
kubectl create deployment nginx -r=2 --image=nginx:latest

# Get everything in Default namespace
kubectl get all -o wide

# Stop the minikube instance
minikube stop