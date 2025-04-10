# EKS High Availability Infrastructure Blueprint

This module provisions a highly available, production-ready **Amazon EKS (Elastic Kubernetes Service)** cluster using **Terraform**.

📁 Path: `IaC/terraform-eks`

---

## 🏗️ Features

- Highly Available EKS Cluster
- Private & Public Subnets across multiple AZs
- Managed Node Groups (with autoscaling)
- Configurable networking (VPC, NAT Gateways, etc.)
- Secure IAM roles and policies
- Outputs for cluster access and configuration

---

## 🚀 Prerequisites

- Terraform >= 1.3.x
- AWS CLI configured (`aws configure`)
- An AWS account with required IAM privileges

---

## 📦 Module Structure

```bash
terraform-eks/
├── main.tf             # Main Terraform config
├── variables.tf        # Input variables
├── outputs.tf          # Output values
├── versions.tf         # Provider requirements
├── locals.tf           # Local variables
└── README.md           # You're here!
