queues_config = {
  "queue-1" = {
    namespace_name                       = "namespaceA",
    dead_lettering_on_message_expiration = false,
    alarm : {
      message_threshold = 25,
      team              = "team1"
      operator           = "GreaterThanOrEqual" // # or GreaterThan
    }
  },
}
