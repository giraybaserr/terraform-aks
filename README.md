# Terraform AKS Deployment

This repository contains Terraform scripts for deploying an Azure Kubernetes Service (AKS) cluster. It provides a simple way to provision an AKS cluster along with necessary Azure resources such as resource groups, virtual networks, and subnets.

## Prerequisites

- Azure subscription
- Azure CLI installed
- Terraform installed

## Quickstart

Follow these steps to deploy your AKS cluster using Terraform:

```bash
# Clone the repository to your local machine
git clone https://github.com/giraybaserr/terraform-aks.git
cd terraform-aks

# Login to your Azure account
az login

# Initialize Terraform
terraform init

# Create a Terraform plan
terraform plan

# Apply the Terraform configuration to deploy the AKS cluster
terraform apply

# Once the deployment is complete, retrieve the AKS cluster credentials
az aks get-credentials --name <AKS_CLUSTER_NAME> --resource-group <RESOURCE_GROUP_NAME>

# To delete the resources created by Terraform
terraform destroy
