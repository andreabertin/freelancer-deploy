# Introduction

This repository will contain all deploy configurations for freelancer project.
Freelancer project is meant to be a self-study project to improve my KB about K8S, MSA, MFE.
Being so, firstly you will find K8S deploy files to run locally (minikube).
Every docker image will be published onto my docker-hub account a freely available.
Every repository will contain its Dockerfile, if you wanna change Dockerfile then will, probably, have to update
K8S refs also.

# K8S

K8S files will be under k8s folder.
For every environment (dev, prod, qa etc..) a folder will be created.
Dev environment will use images latest version, meant for CI/CD.
Prod environment will use images stable version, meant for stable CI/CD.
Every other environment for QA or Demos, will use images x.y.z version.
