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

# 3. Create a resource group
resource "azurerm_resource_group" "nizari" {
  name     = "queues-resources"
  location = var.location
}

resource "azurerm_servicebus_namespace" "namespaceA" {
  name                = "namespaceA"
  location            = var.location
  resource_group_name = azurerm_resource_group.nizari.name
  sku                 = "Basic" # standard or premium https://www.serverlessnotes.com/docs/service-bus-namespace-standard-or-premium-tier
}

resource "azurerm_servicebus_namespace" "namespaceB" {
  name                = "namespaceB"
  location            = var.location
  resource_group_name = azurerm_resource_group.nizari.name
  sku                 = "Basic" # standard or premium https://www.serverlessnotes.com/docs/service-bus-namespace-standard-or-premium-tier
}

resource "azurerm_servicebus_namespace" "namespaceC" {
  name                = "namespaceC"
  location            = var.location
  resource_group_name = azurerm_resource_group.nizari.name
  sku                 = "Basic" # standard or premium https://www.serverlessnotes.com/docs/service-bus-namespace-standard-or-premium-tier
}


resource "azurerm_monitor_action_group" "team1" {
  name                = "team-1"
  short_name          = "team-1"
  resource_group_name = azurerm_resource_group.nizari.name

  email_receiver {
    name          = "email-receiver"
    email_address = "daanhage+1@gmail.com"
  }
}
resource "azurerm_monitor_action_group" "team2" {
  name                = "team-2"
  short_name          = "team-2"
  resource_group_name = azurerm_resource_group.nizari.name

  email_receiver {
    name          = "email-receiver"
    email_address = "daanhage+2@gmail.com"
  }
}
resource "azurerm_monitor_action_group" "team3" {
  name                = "team-3"
  short_name          = "team-3"
  resource_group_name = azurerm_resource_group.nizari.name

  email_receiver {
    name          = "email-receiver"
    email_address = "daanhage+3@gmail.com"
  }
}