# Kubernetes Project Setup Guide

This guide provides steps to set up your Kubernetes project, including installing Certbot, obtaining SSL certificates, creating Kubernetes secrets, and configuring your deployment.

## Prerequisites

- Domain names for your control machine and load balancer.
- Kubernetes and kubectl installed and configured.

## Steps

### 0. Point DDNS

Ensure your domains' DDNS are pointing correctly:

    Control Machine: Point DDNS to your control machine. (A)

### 1. Install Certbot

To obtain SSL certificates for your domains, first install Certbot:

```bash
sudo yum install certbot
```

### 2. Obtain SSL Certificates

Run Certbot to obtain SSL certificates for your domains:

```bash
sudo certbot certonly
```

### 3. Copy Certificates to Your Project

Switch to the root user and navigate to the Let's Encrypt live directory:

```bash
sudo su
cd /etc/letsencrypt/live
```
Find your domain folder, then copy the certificates to your project directory:

```bash
cd [your folder]
cp fullchain.pem /home/ec2-user/Kubernetes-Project/kubeproject/certs/
cp privkey.pem /home/ec2-user/Kubernetes-Project/kubeproject/certs/
```

### 4. Create Kubernetes Secret

Change to your project certificates directory and create a Kubernetes secret:

```bash
cd /home/ec2-user/Kubernetes-Project/kubeproject/certs
sudo kubectl create secret generic danielp-secret --from-file=privkey.pem --from-file=fullchain.pem
```
### 5. Set Permissions

Change the ownership of the copied certificate files to the ec2-user:

```bash
sudo chown ec2-user:ec2-user fullchain.pem privkey.pem
```


### 6. Update Configurations

    ConfigMap: Update your ConfigMap to include your domains.
    Deployment: Update your deployment configuration to reference the created secret.

### 7. Point DDNS

Ensure your domains' DDNS are pointing correctly:

    Delete the previous name registries (A)
    Load Balancer: Point DDNS to your AWS load balancer. (CNAME)

# Bonus

### 1. Cleaning when you mess it up:

```bash
kubectl delete --all all -n default
```

### 2. Check your logs !

```bash
kubectl logs
kubectl describe
```
