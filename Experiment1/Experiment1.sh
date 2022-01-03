#!bin/bash

minikube start

# Get everything in all namespaces
kubectl get all --all-namespaces