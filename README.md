# MINIKUBE SLATRA

Slatra means "to butcher" which might not be the exact analogy as we are NOT breaking Minikube. What we want to do is to experiment, learn and do some cool stuff in Minikube and Kubectl.

I would like to learn the K8 concepts, experiment around with the Control Plane as well as Working Nodes and do some Go Scripting to automate workflows (We will get to that maybe as my understanding grows.).

1. Concepts about Kubernetes are in THIS README.
2. Concepts about commands of minikube and Kubectl and discoveries from them are in EXPERIMENT FOLDER READMEs.

## What is Minikube and Kubectl?
Minikube is a Single Node Cluster.

Try to go over [this link](https://kubernetes.io/docs/tasks/tools/) and get both set up. I am using Docker to run Minikube, you can use Hypervisors of your choice.

## How I will know What to do next?
Okay, So I will be reading `kubernetes.io` website in depth. For each concept I study, I will try to articulate scenarios in minikube. It will be interesting. I will be logging commands Experiment wise and log my thoughts about what I learned in form of blogs/Readme. The Concepts I learn will be listed Below.

## Concepts

### K8 architecture
Nodes are machines(virtual or bare metal) which have kubelet, kube-proxy and a container runtime(containerd, crio etc) installed. Nodes can self register to API server. Their identifier is their name. The state of the node is tied to the name. There is a concept of Heartbeat to make API Server know that Node is alive.

### Kubernetes Objects
These are persistent entities(can stay across runs). They tell about state of the application(details of containers, resource available to them, Policies like restart, upgrades etc.). This is the desired state that the control plane works to achieve. Examples include :- Pods, Deployment, Service. You can declare this using YAML files. 

Resource URL :- `/api/v1/pods/some-name`

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

Naming :- A K8 object can have a unique name across that Object but not across Objects. This means a Pod and Deployment can have a Deployment. This is client generated.

UID :- System generated String. Unique in the whole cluster. 

#### Namespaces
Isolate a group of resources in a cluster. Use case for a Namespace is for many users across multiple teams. They are used to divide resources between Users. Example in my team in Intuit, my BU had a separate namespace where all our applications lived. Other Business Unit had different namespace. Not required for small clusters(like ourselves. But no harm in learning). Namespaces are unique entities with NO nesting. 

DNS uses Namespace name :- `service-name.namespace-name.svc.cluster.local`

Note :- Not all K8 Objects are in Namespace. Eg:- Nodes

#### Labels and Selectors
These are attached to K8 objects. Labels are key=value pairs. These are identifying attributes. Can be added at anytime. These are in metadata of the K8 object. A Label Selector helps to group the objects based on labels. For eg:- In `kubectl get pods -l tier!=frontend`.

Often used to identify the pods a Service will target. 

#### Annotations
TO attach non identifying metadata, we can use annotations. Again this is in metadata. Not used to select object like label.

#### Service
Service lets you access your containers from outside the Cluster. This can be another cluster or the internet. They lay out a policy to access the pods. 

A good example to understand Service :- There are many pods of frontend. All of them will query from a backend. So, if you assign each frontend pod a backend pod, this would mean they become coupled. What service does is that it acts as a layer. Frontend pods send request to this layer and this layer then distributes the requests among backend pods. Thereby decoupling frontend and backend.