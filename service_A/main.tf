# 1. Specify the version of the AzureRM Provider to use
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

# 2. Configure the AzureRM Provider
provider "azurerm" {
  # The AzureRM Provider supports authenticating using via the Azure CLI, a Managed Identity
  # and a Service Principal. More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure

  # The features block allows changing the behaviour of the Azure Provider, more
  # information can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block
  features {}
}


resource "azurerm_servicebus_queue" "queues" {
  for_each = var.queues_config

  name                                 = each.key
  namespace_id                         = local.get_namespace_id[each.value.namespace_name]
  dead_lettering_on_message_expiration = each.value.dead_lettering_on_message_expiration
}

resource "azurerm_monitor_metric_alert" "queue_alerts" {
  for_each = { for k, v in var.queues_config : k => v if v.alarm != null }

  name = "queue-alert-${each.key}"
  # scopes              = [azurerm_servicebus_queue.queues[each.key].id]
  scopes = [local.get_namespace_id[each.value.namespace_name]] ##changed to namespace resourceid instead of queue resourceid.

  resource_group_name = local.resource_group_name
  description         = "Queue ${each.key} Message Count Alert"
  window_size         = "PT15M"

  criteria {
    metric_namespace = "Microsoft.ServiceBus/namespaces"
    metric_name      = each.value.dead_lettering_on_message_expiration ? "DeadletteredMessages" : "Messages"
    aggregation      = "Average"
    operator         = "GreaterThanOrEqual"
    threshold        = each.value.alarm.message_threshold

    dimension {
      name     = "EntityName"
      operator = "Include"
      values   = [azurerm_servicebus_queue.queues[each.key].name]
    }
  }

  action {
    action_group_id = local.get_team_id[each.value.alarm.team]
  }
}
