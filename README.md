# Ekscape

> **A production-ready, high-availability EKS platform with CI/CD, observability, and alerting – all in one blueprint.**

---

## 🚀 Overview

**Ekscape** is an open-source, opinionated blueprint for deploying a highly available Amazon EKS cluster. It integrates modern DevOps tools and best practices to streamline infrastructure management and application delivery.

This project is perfect for engineers, teams, and platform architects looking to stand up a production-grade Kubernetes cluster with minimal friction.

---

## 🧰 Features

- ⚙️ **High Availability (HA)**: Multi-AZ EKS setup with self-healing node groups
- 🔄 **CI/CD Integration**: GitOps-driven continuous delivery using ArgoCD or Flux
- 📊 **Observability**: Full ELK stack (Elasticsearch, Logstash, Kibana) for logs and monitoring
- 🚨 **Alerting**: Integrated with PagerDuty for incident response
- 🔐 **Security Best Practices**: IAM roles, secrets management, and private networking
- 🧱 **Modular Infrastructure**: Easily extendable Terraform/Helm modules
- 🌐 **Infrastructure as Code**: Fully automated cluster and platform provisioning

---

## 🗂️ Project Structure

```bash
.
├── modules/                 # Terraform or Helm modules for infra components
├── argo-cd/                 # CD configuration and example apps
├── monitoring/              # ELK Stack setup and dashboards
├── alerting/                # PagerDuty config and alert rules
├── scripts/                 # Utility and bootstrap scripts
├── README.md
└── LICENSE
