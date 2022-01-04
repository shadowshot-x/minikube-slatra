# Experiment 1

Main aim of this Experiment to just start a Minikube cluster, play around with Pods, Deployments and Namespaces. We will mainly explore kubectl commands, their options and some concepts surrounding them. Lets also explore `kubectl apply` using YAML files.

## Kubectl GET

This helps to list major *K8 resources*. We can filter the results using "labels and selectors". As we saw in Experiment 0, Kubectl is configured to talk to "default" namespace. There are more namespaces like "kube-system". This includes control plane pods. Lets see Everything in our Kubernetes cluster.

`$ kubectl get all --all-namespaces`

To get this output or any other output in JSON, you can run this :-

`$ kubectl get all --all-namespaces -o JSON | jq`

We can find the pods running by specifying in a YAML file. You can also pass `-R` and specify a directory. It will Recursively query for all provided.

`$ kubectl get -f pods.yaml`

Get Resources using Labels and selectors

`$ kubectl get services -l mylabel=myselector`

Watch for changes ie. Dont exit and hold the Terminal screen. This works for only a single resource and not for `all`.

`$ kubectl get pods --all-namepaces -w`

### Kubectl get pods
Pods can be seen as abstraction for running containers. Containers(Multiple or Single) run inside a single pod.

`$ kubectl get pods -n kube-system -o wide`

`$ kubectl get pods --field-selector metadata.name=myname`

This is an example of field selector. These are resource fields. 

`$ kubectl get pods --all-namespaces --field-selector metadata.namespace!=default`

Here we list all the pods in kube-system namespace with the control plane. These include CoreDNS, etcd, kube-apiserver, kube-controller-manager, kube-proxy(as this is also a Node) and kube-scheduler. We can see the Number of pods for each type, Status, Restarts, Age and IP. 

### Kubectl get deployments
Deployments are respresentation of your application. This includes multiple instances that you can specify. You can apply selectors in Deployments.

`$ kubectl get deployments -n kube-system -o wide`

In control plane, there is only 1 Deployment and that is of CoreDNS. We can see the Selector provided and we can use a get command to get this specific object.

`$ kubectl get deployments --all-namespaces -l k8s-app=kube-dns -o wide`

### Kubectl get namespaces
We have 4 namespaces running in our K8 minikube.

1. Default - Remember kubectl is configured to talk to here
2. kube-system - Our control-plane
3. kube-public - This is visible by everyone in the cluster. Resources in this can be used by anyone in the cluster
4. kube-node-lease - Not clear. Allows heartbeat to be sent by kubelet to control plane.

## Kubectl create
Helps to create K8 resources. We are limiting ourselves to Deployment, Pod and Namespaces right now. But, many other things can be created. This includes ingress, configmap, secrets, cronjob, role, service etc. It also has similar commands like -l, -R, -o which provide same functions as above.

### Kubectl create deployment
Lets create a Deployment named nginx with 2 running instances of nginx image. 

`$ kubectl create deployment nginx -r=2 --image=nginx:latest`

We get an automatic selector "app=nginx"

Now, we can stop our minikube cluster.