# Logo Server

A simple Express.js web server that serves the Swayatt logo image.

## What is this app?

This is a lightweight Node.js application built with Express.js that serves a single logo image (`logoswayatt.png`) when accessed through a web browser. When you visit the root URL, the server responds by displaying the Swayatt logo.

## Prerequisites

- Node.js (version 12 or higher)
- npm (Node Package Manager)

## Installation

1. Clone or download this repository
2. Navigate to the project directory:
   ```bash
   cd "devops task"
   ```
3. Install dependencies:
   ```bash
   npm install
   ```

## How to Start the App

Run the following command:
```bash
npm start
```

The server will start and display:
```
Server running on http://localhost:3000
```

## Usage

Once the server is running, open your web browser and navigate to:
```
http://localhost:3000
```

You will see the Swayatt logo displayed in your browser.

## Repo contents
- `app/` — application source and `Dockerfile`
- `Jenkinsfile` — Jenkins pipeline (declarative)
- `k8s/` — Kubernetes manifests for app
- `monitoring/` — Prometheus & Grafana manifests
- `terraform/` —  infra skeleton

# Prereqs
- GitHub repo
- Jenkins (with GitHub integration)
- DockerHub account
- AWS account + EKS cluster or kubectl pointing to cluster
- AWS CLI configured (with IAM permissions for EKS, ECR, )


## Challenges Faced & Solutions

1. Issue: EKS nodes showing `NotReady` state.  
   Solution: Corrected IAM roles and node group configuration via Terraform to allow proper worker node registration.

3. Issue: Jenkins pipeline failures due to missing credentials.  
   Solution: Configured AWS, DockerHub, and GitHub credentials in Jenkins securely, ensuring successful builds and deployments.

4. Issue: Initial misconfigurations in Kubernetes manifests.  
   Solution: Debugged YAML files, validated manifests with `kubectl`, and redeployed.

   ##  Possible Improvements
- Adding Enviroments like staging and production in K*s
- integrating with Testing tool like Sonarqube and trivy 
- Use ArgoCD or Flux for GitOps-based continuous delivery.
- Enable autoscaling for application pods and cluster nodes.
- Harden security with IAM least-privilege roles and network policies.
- Including LoadBalancer


## Technical Details

- **Framework**: Express.js
- **Port**: 3000
- **Endpoint**: GET `/` - serves the logo image
- **File served**: `logoswayatt.png`
