# Experiment 0

Lets go over Overview. Undertanding what Minikube is and How it is starting things up. What the Instructions actually mean that occur when we run `minikube start`.

## Minikube start
This command starts your Single Node K8 cluster. I have configured Minikube to take only 2GB space and 2 cores. I have a total of 8GB RAM. It will be a bit slow for 4GB RAM but it will still work(personal experience). When you run `minikube start`, You will see some beautiful logs popping up. Lets Understand them.

1. It gives us a Version Description we are currently on and checks if there is some updated version. Cool, good utility, keep on updating from time to time.
2. Next it checks for Driver. Driver is the interface you want to run Minikube on. Some of these include virtualbox, vmware, podman, Docker etc. I am chosing Docker which means our Minikube cluster will run on a Docker Container! How cool is that! CONTAINER ORCHESTRATION FRAMEWORK ON A CONTAINER!!!!
3. Next step is to set up the control plane(apiserver, kube-control-manager, etcd). The cluster for control plane is minikube.
4. As we have Docker driver, Minikube then fetches the latest Kubernetes Image(currently v1.21.2). This is then started on the container.
5. If all goes well, Minikube finally looks for add-ons which can be specified as an array with minikube start.
6. Lastly, it configures the Kubectl command to talk to `minikube` cluster(Remember, the control plane is here) and in that cluster, to the `default` namespace. Something to Note, We can create more clusters.

## Minikube config
Configuration that Minikube is working on. I am using Docker as a Container Runtime, however, Minikube supports CRIO and Containerd.  