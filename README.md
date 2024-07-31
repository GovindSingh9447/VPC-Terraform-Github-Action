# VPC Terraform GitHub Action

This project sets up a CI/CD pipeline using GitHub Actions to automate the deployment of AWS VPC resources with Terraform. The setup includes Terraform scripts for defining infrastructure and GitHub Actions workflow for automating the deployment process.

## Project Structure

```plaintext
VPC-Terraform-Github-Action/
│
├── .gitignore
├── main.tf
├── provider.tf
├── terraform.tfvars
├── variables.tf
└── .github/
    └── workflows/
        └── terraform.yml
```

## Directory and File Descriptions
- `modules/:` Contains reusable Terraform modules.
- `main.tf:` Main Terraform configuration file.
- `provider.tf:` Configuration for Terraform providers (e.g., AWS).
- `terraform.tfvars:` Contains variable values for the Terraform configuration.
- `variables.tf:` Defines the variables used in the Terraform configuration.
- `.github/workflows/terraform.yml:` GitHub Actions workflow for Terraform CI/CD pipeline.

## Prerequisites
- Terraform installed locally
- AWS account and IAM user with appropriate permissions
- GitHub repository with the necessary secrets configured

# Setup
## Configure AWS Credentials
### Store your AWS credentials as secrets in your GitHub repository:

- `AWS_ACCESS_KEY`: Your AWS access key.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.

## Terraform Configuration
Edit the `terraform.tfvars` file to set your desired values for the Terraform variables.

## GitHub Actions Workflow
The GitHub Actions workflow is defined in `.github/workflows/terraform.yml`:

```plaintext
name: Terraform CI CD Pipeline for Deploying AWS Resources
run-name: ${{ github.actor }} has triggered the pipeline

on:
  push:
    branches:
      - 'main'

env:
  AWS_ACCESS_KEY: ${{ secrets.AWS_ACCESS_KEY }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

jobs:
  build-infra:
    name: terraform-ci-cd
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v2
      - name: Terraform Init
        id: init
        run: terraform init
        working-directory: ./Terraform-VPC
      - name: Terraform Validate
        id: validate
        run: terraform validate
        working-directory: ./Terraform-VPC
      - name: Terraform Plan
        id: plan
        run: terraform plan
        working-directory: ./Terraform-VPC
      - name: Terraform Apply
        id: apply
        run: terraform apply --auto-approve
        working-directory: ./Terraform-VPC
````
# Usage

1. Clone the repository:
   ````
   git clone https://github.com/GovindSingh9447/VPC-Terraform-Github-Action.git
   cd VPC-Terraform-Github-Action
   ````

2. Edit the Terraform variable values:
   - Modify the `terraform.tfvars` file with your desired configuration values.

3. Push changes to GitHub:
   - Commit and push your changes to the `main` branch of your GitHub repository. This will trigger the GitHub Actions workflow.

4. Monitor the workflow:
   - Go to the Actions tab of your GitHub repository to monitor the progress of the CI/CD pipeline.      
