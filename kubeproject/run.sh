#!/bin/bash

sleep 1
kubectl apply -f postgres-deployment.yaml

sleep 1
kubectl apply -f plik-deployment.yaml

sleep 1
kubectl apply -f wiki-deployment.yaml

sleep 1
kubectl apply -f onetimesecret-deployment.yaml

sleep 1
kubectl apply -f ejbca-deployment.yaml

sleep 1
kubectl apply -f nginx-configmap.yaml

sleep 1
kubectl apply -f nginx-deployment.yaml
