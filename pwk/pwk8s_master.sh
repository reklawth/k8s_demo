#!/bin/sh
# To be run on Kubernetes Master Node
# Author : reklawth
# Script follows here:

echo 1. Initializes cluster master node:

kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16

read -t 15 -p "Wait for 15 seconds only ..."
echo 2. Initialize cluster networking:

kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml


echo 3. (Optional) Create an nginx deployment:

kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/nginx-app.yaml