# Terraform Azure


## Setup Azure CLI and Terraform

Follow along these articles:

- https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli
- https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build

Next initialize your terraform project:

```console
terraform init
```

## Configure your variables.tfvars

Go to your `variables.tfvars` file and enter the details of your Azure queue. You can add as many as you like.

<!-- create a table based on variables.tfvars to explain what each value does  -->

| Variable                               | Description                                                                                                                                                                                     |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `namespace_name`                       | The name of the namespace. Must be one of these values: `namespaceA`, `namespaceB`, `namespaceC`                                                                                                |
| `dead_lettering_on_message_expiration` | A boolean value indicating if this queue should be a dead-letter-queueu                                                                                                                         |
| `alarm`                                | A list of objects containing the monitor settings for this queue.                                                                                                                               |
| `alarm.message_threshold`              | The number of messages that can be in the queue before an alert is triggered.                                                                                                                   |
| `alarm.team`                           | The team that should be alerted when the threshold is reached. Must be one of these values: `team1`, `team2`, `team3`                                                                           |
| `alarm.operator`                       | The operator that should be used to compare the threshold with the current number of messages.  Must be one of these values: `GreaterThanOrEqual`, `GreaterThan`, `LessThanOrEqual`, `LessThan` |



## Verify your terraform plan

```console
terraform plan -var-file="variables.tfvars"
```

## Apply your terraform plan

When you are ready to deploy your terraform queue(s), run:

```console
terraform apply -var-file="variables.tfvars"
```

You can keep updating your `variables.tfvars` file and re-run the `terraform apply` command to add more queues or update existing ones.

## Destroy your terraform plan

When you want to completely destroy your terraform queue(s), run:

```console
terraform destroy -var-file="variables.tfvars"
```