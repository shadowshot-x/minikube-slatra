#!bin/bash

# Lets boot a minikube cluster with a Single Node.

minikube start

# Display the available options to minikube start

minikube start --help

# Display the config variables.

minikube config view

# Display the running Minikube clusters on your machine

minikube profile list

# Stop the Minikube cluster

minikube stop