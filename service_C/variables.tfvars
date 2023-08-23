queues_config = {
  "queue-3" = {
    namespace_name                       = "namespaceB",
    dead_lettering_on_message_expiration = true,
    alarm : {
      message_threshold = 0,
      team              = "team2"
      operator          = "GreaterThan" // # or GreaterThanOrEqual
    }
  },
  "queue-4" = {
    namespace_name                       = "namespaceB",
    dead_lettering_on_message_expiration = false,
    alarm : {
      message_threshold = 10,
      team              = "team2"
      operator          = "GreaterThan" // # or GreaterThan
    }
  }
}
