# Terraform Azure

## General commands

### Terraform

```console
terraform init
terraform plan
# format files
terraform fmt
terraform validate
terraform apply
terraform destroy
```

### Azure

```console
az account set --subscription "{{SUBSCRIPTION_ID}}"
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/{{SUBSCRIPTION_ID}}"
az account list-locations
az vm list-sizes --location westeurope
```

## Usage

View the [USAGE.md](USAGE.md) file for how the development teams can use this.

## Todo

View the [TODO.md](TODO.md) for points to improve this project and upgrade the terraform plan.

## Questions

View the [QUESTIONS.md](QUESTIONS.md) to see issues I personally got stuck and would like help to improve the project.

## Useful Links

### Terraform

- https://developer.hashicorp.com/terraform/tutorials/azure-get-started/infrastructure-as-code
- https://blog.funda.nl/learning-terraform-lessons/
- https://developer.hashicorp.com/terraform/language/values/variables
- https://dzone.com/articles/terraform-best-practices-the-20-practices

### Azure

- https://arsenvlad.medium.com/mapping-aws-iam-concepts-to-similar-ones-in-azure-c31ed7906abb
- https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messaging-overview
- https://guisester.medium.com/build-azure-service-bus-queues-using-terraform-925bc24a6e24
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#creating-a-service-principal-using-the-azure-cli
- https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/servicebus
