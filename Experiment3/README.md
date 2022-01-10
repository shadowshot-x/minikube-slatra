# Experiment 3

In this experiment, we will first deploy 2 pods onto the minikube cluster. After that, we will change the container runtime to containerd and see how the minikube cluster behaves. We will then manually expose this Deployment and run another pod here. After this has been set up successfully, we will again choose Docker as our CRI.

We will learn about `minikube delete`, `minikube config`.

## Minikube delete
This command deletes the local K8 cluster. Cache is removed and VM instances are removed. You can even delete `.minikube file`.

`$ minikube delete --all`

## Minikube config
Most of the config can be set during `minikube start`

```
 * driver - Driver on which minikube will run
 * vm-driver - Driver for VM
 * container-runtime - Who is taking of the container? Is it Docker, containerd, crio?
 * feature-gates
 * v
 * cpus - Number of CPUs to allot.
 * disk-size - 
 * host-only-cidr
 * memory - Memory alloted.
 * log_dir
 * kubernetes-version - If you want to use a previous version, you can
 * iso-url
 * WantUpdateNotification
 * WantBetaUpdateNotification
 * ReminderWaitPeriodInHours
 * WantNoneDriverWarning
 * profile
 * bootstrapper - Helps to start up minikube.Eg - `kube-adm` 
 * insecure-registry
 * hyperv-virtual-switch
 * disable-driver-mounts
 * cache
 * EmbedCerts
 * native-ssh
```

### Minikube config get
Simply specify any of the above keys after `minikube config get` and find the set value. This only works if you have set the value.

### Minikube config set
So, this is used to set the state of the config. I have tried changing value of container-runtime. However, Minikube asks to delete the whole profile and then start which would mean I would loose my data. Containerd can run Docker containers due to OCI containers.

`minikube config set container-runtime crio`