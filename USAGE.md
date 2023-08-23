# Terraform Azure


## Setup Azure CLI and Terraform

Follow along these articles:

- https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli
- https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build

## Terraform commands

```console
terraform init
terraform plan -var="location=westus" -var="prefix=team1"
terraform apply -var="location=westus" -var="prefix=team1"
terraform destroy
```