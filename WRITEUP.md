# WRITEUP – DevOps Task

## Part 1: Application Containerization with Docker
- Created and tested the application locally.
- Wrote a **Dockerfile** to containerize the application.
- Built and ran the Docker container locally.
- Verified application functionality through local browser access (`http://localhost:8080`).

---

## Part 2: Infrastructure Setup with Terraform (EKS)
- Used **Terraform** to provision AWS EKS cluster.
- Created **EKS cluster** and **node groups** in default VPC.
- Configured `aws-auth` and `kubeconfig` to connect `kubectl` with EKS.
- Verified worker nodes were successfully joined to the cluster.

---

## Part 3: Jenkins CI/CD Pipeline
- Installed **Jenkins** on an EC2 instance.
- Configured required plugins and credentials:
  - GitHub (for SCM)
  - DockerHub (for pushing Docker images)
  - AWS (for deployment to EKS)
- Created a **Jenkinsfile** defining pipeline stages:
  1. Checkout code from GitHub (SCM trigger enabled).
  2. Build Docker image.
  3. Push image to DockerHub.
  4. Deploy application to EKS.
- Successfully deployed the application through Jenkins pipeline.

---

## Part 4: Monitoring with Prometheus & Grafana
- Deployed **Prometheus** in Kubernetes (`monitoring` namespace) for metrics collection.
- Deployed **Grafana** in Kubernetes and configured Prometheus as a data source.
- Accessed Grafana UI via NodePort.
- Imported pre-built Kubernetes dashboards to visualize:
  - Cluster health
  - Pod resource usage
  - Application-level metrics

---

## Tools & Services Used
- **AWS EKS** (Elastic Kubernetes Service)
- **Terraform** (Infrastructure as Code)
- **Docker** (Containerization)
- **Jenkins** (CI/CD automation)
- **Kubernetes** (Deployment & Orchestration)
- **Prometheus** (Metrics)
- **Grafana** (Visualization)
- **GitHub SCM Webhook** (Pipeline triggers)

---

## Challenges & Fixes
- **CloudWatch agent crash loops** → switched to Prometheus + Grafana.
- **Nodes in NotReady state** → fixed IAM role and node group permissions.
- **Pipeline errors due to missing secrets** → added credentials in Jenkins securely.
- **YAML misconfigurations** → validated and redeployed manifests.

---

## Possible Improvements
- Replace raw Kubernetes manifests with **Helm charts**.
- Implement **GitOps (ArgoCD/Flux)** for better deployment workflows.
- Add **Pod Autoscaling (HPA)** and **Cluster Autoscaler**.
- Integrate **centralized logging (ELK stack)**.
- Strengthen security with **IAM least-privilege roles** and **network policies**.
