# MINIKUBE SLATRA

Slatra means "to butcher" which might not be the exact analogy as we are NOT breaking Minikube. What we want to do is to experiment, learn and do some cool stuff in Minikube and Kubectl.

I would like to learn the K8 concepts, experiment around with the Control Plane as well as Working Nodes and do some Go Scripting to automate workflows (We will get to that maybe as my understanding grows.).

## What is Minikube and Kubectl?
Minikube is a Single Node Cluster.

Try to go over [this link](https://kubernetes.io/docs/tasks/tools/) and get both set up. I am using Docker to run Minikube, you can use Hypervisors of your choice.

## How I will know What to do next?
Okay, So I will be reading `kubernetes.io` website in depth. For each concept I study, I will try to articulate scenarios in minikube. It will be interesting. I will be logging commands Experiment wise and log my thoughts about what I learned in form of blogs/Readme.

## Concepts

### Kubernetes Objects
These are persistent entities(can stay across runs). They tell about state of the application(details of containers, resource available to them, Policies like restart, upgrades etc.). This is the desired state that the control plane works to achieve. Examples include :- Pods, Deployment, Service. You can declare this using YAML files. 

```
apiVersion : app/v1
kind : Deployment/Pod/ReplicaSet/Service
metadata : 
    name : object-name
spec :  # Desired State you want
    containers:
    -   name : nginx
        image : nginx:latest
        ports:
        -   containerPort:80
```

Format of `spec` for K8 object. 