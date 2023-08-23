variable "namespace_id_map" {
  type = map(string)
  default = {
    "namespaceA" = "/subscriptions/06e5597c-e4c6-4166-b4b8-3f26fcd12f74/resourceGroups/queues-resources/providers/Microsoft.ServiceBus/namespaces/namespaceA",
    "namespaceB" = "/subscriptions/06e5597c-e4c6-4166-b4b8-3f26fcd12f74/resourceGroups/queues-resources/providers/Microsoft.ServiceBus/namespaces/namespaceB",
    "namespaceC" = "/subscriptions/06e5597c-e4c6-4166-b4b8-3f26fcd12f74/resourceGroups/queues-resources/providers/Microsoft.ServiceBus/namespaces/namespaceC",
    # Add more namespaces and their IDs as needed
  }
}
variable "alarm_team_id_map" {
  type = map(string)
  default = {
    "team1" = "/subscriptions/06e5597c-e4c6-4166-b4b8-3f26fcd12f74/resourceGroups/queues-resources/providers/Microsoft.Insights/actionGroups/team-1"
    "team2" = "/subscriptions/06e5597c-e4c6-4166-b4b8-3f26fcd12f74/resourceGroups/queues-resources/providers/Microsoft.Insights/actionGroups/team-2"
    "team3" = "/subscriptions/06e5597c-e4c6-4166-b4b8-3f26fcd12f74/resourceGroups/queues-resources/providers/Microsoft.Insights/actionGroups/team-3"
    # Add more namespaces and their IDs as needed
  }
}

variable "queues_config" {
  description = "Configuration for queues"

  type = map(object({
    namespace_name                       = string
    dead_lettering_on_message_expiration = bool
    alarm = optional(object({
      message_threshold = number
      team              = string # @todo add validation
      operator          = string
    }))
  }))
}
