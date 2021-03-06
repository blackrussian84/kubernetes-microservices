#!/bin/bash
cluster_name=k8s-microservices-${RANDOM}

# Create eks cluster using eksctl
echo "Creating eks cluster and node group with two t3.large instances ..."
sed -i "s/@cluster_name@/${cluster_name}/" eks.yaml
eksctl create cluster -f eks.yaml

# Setup OIDC ID provider
eksctl utils associate-iam-oidc-provider --cluster ${cluster_name} --approve

# Test if kubernate cluster works good
kubectl get all

echo 'Done setting EKS.'
