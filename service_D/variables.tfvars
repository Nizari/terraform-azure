queues_config = {
  "queue-5" = {
    namespace_name                       = "namespaceA",
    dead_lettering_on_message_expiration = false,
    alarm : {
      message_threshold = 50,
      team              = "team3"
      operator          = "GreaterThan" // # or GreaterThanOrEqual
    }
  },
}
