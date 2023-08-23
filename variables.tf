variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type        = string
  default     = "westeurope"
  validation {
    condition     = var.location == "northeurope" || var.location == "westeurope" || var.location == "francecentral"
    error_message = "Invalid location value. You can only select 1 of the following 3 europe regions: 'northeurope', 'westeurope', or 'francecentral'."
  }
}