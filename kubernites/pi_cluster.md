# Rasbperry PI cluster (k3s)

Study project for kubernites on rasperry PI.

## Configuration

4 nodes with Rasbian Bluster on Pi 4. With static ip address setup on router. 
Run K3s ligth kubernites.

## Installation process

Follow docs on K3s site project and a blog https://blog.alexellis.io/test-drive-k3s-on-raspberry-pi.

1. Setup ssh access on all rasp.

2. Connect to the first rasp, this will be our master node.

3. Download and exec the installation K3s script
	
	```
	curl -sfL https://get.k3s.io | sh -
	```
4. Check k3s service status and reboot
5. Check that a single node is active
   
   ```
   sudo kubectl get nodes
   ```
6. extract node token to join the cluster
 
   ```
   cat /var/lib/rancher/k3s/server/node-token

   ```
7. Connect to the new node and runn
  
   ```
   curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -
   ```
8. Copy /etc/rancher/k3s/k3s.yaml into your local laptop into 
   ~/.kube/config and install kubectl so you can access your 
   cluster without connecting to your master node. Replece the server: http://127.1.1:6443 with the address or name of your master server.


## Monitor your cluster with prometheus

1. Install node_exporter from github and create a systemd file that start the process.

# Raspberry pi cluster (kubedeam)

## Configuration 

1. Check that MAC address are different from pii node
 
 ```
  ip link (ipconfig -a)
 ```
2. Ensure tha iptable see bridged traffic. Verify that *br_netfilter* is loaded 
   with `lsmod | grep br_netfilter`

   ```(shell)
   cat <<EOF sudo tee /etc/sysctl.d/k8s.conf
   net.bridge.bridge-nf-call-ip6tables = 1
   net.bridge.bridge-nf-call-iptables = 1
   EOF
   sudo sysctl --system
   ```
3. install a container runtime (docker, contanerd, CRI-O)
4. install kubedeam, kubectl, kubelet
   if cri is different from docker, need to specify the cgroup driver fi different from cgroupfs
