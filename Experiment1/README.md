# Experiment 1

Main aim of this Experiment to just start a Minikube cluster, play around with Pods, Deployments and Namespaces. We will mainly explore kubectl commands, their options and some concepts surrounding them. Lets also explore `kubectl apply` using YAML files.

## Kubectl GET

This helps to list major K8 resources. We can filter the results using "labels and selectors". As we saw in Experiment 0, Kubectl is configured to talk to "default" namespace. There are more namespaces like "kube-system". This includes control plane pods. Lets see Everything in our Kubernetes cluster.

`$ kubectl get all --all-namespaces`

To get this output or any other output in JSON, you can run this :-

`$ kubectl get all --all-namespaces -o JSON | jq`

We can find the pods running by specifying in a YAML file. You can also pass `-R` and specify a directory. It will Recursively query for all provided.

`$ kubectl get -f pods.yaml`

Get Resources using Labels and selectors

`$ kubectl get services -l mylabel=myselector`

Watch for changes ie. Dont exit and hold the Terminal screen. This works for only a single resource and not for `all`.

`$ kubectl get pods --all-namepaces -w`