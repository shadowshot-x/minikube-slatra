# Experiment 2

Main aim of this Experiment is to play around with services. Some commands we will discover in this experiment include :- `minikube service`, `kubectl expose`, `minikube tunnel`.

1. Lets simulate a Minikube cluster with 2 Deployment, 3 pods of nginx image(consider them as the frontend image) running using a Deployment and 2 pods of another Deployment of nginx. 
2. We want our frontend to be accessible to the outside world. So, we will create service if type NodePort and then of type Load Balancer.
3. We want our backend to be accessible by our frontend pods only. So, we look at internal communication.

It can be a bit tiring to make a service using CLI. So, I will use a YAML file here.

## Minikube service list
This displays details about services running in Minikube. This even provides the URL for the exposed services! Good utility tool.

`$ minikube service list`

## Minikube tunnel
This is used for services of type `LoadBalancer`. This helps to make their ClusterIP accessible by setting an Ingress. This constantly runs in a separate terminal and LoadBalancer services are accessible only till this is running.

`$ minikube tunnel`

Output type

```
Status:	
	machine: minikube
	pid: 136519
	route: 10.96.0.0/12 -> 192.168.49.2
	minikube: Running
	services: []
    errors: 
		minikube: no errors
		router: no errors
		loadbalancer emulator: no errors
```

## kubectl exec -it
I want to send an internal curl from the frontend to the backend. Instead of using the `kube-api-server` to do this(not even sure if its possible), I want to access the terminal of the container in which frontend service is running. I will query the backend service to show how internal service routing works.

This command helps to get an interactive terminal. You can simply execute a single command by removing the `-it`. From what I remember, the base image I used for my image was alpine. It wont have the `curl` installed and I can install `curl` on this container.

`$ kubectl exec frontend-deployment-7766588c6-2ksnh -it -- /bin/sh`

We can then query our backend from this using ClusterIP Service. 

`$ curl http://service-backend:81/ping`

This gives us the reply. Actually, service-backend name is being queried for IP in the CoreDNS. Then using this IP, we are getting the curl request's response.