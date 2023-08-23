queues_config = {
  "queue-1" = {
    namespace_name                       = "namespaceA",
    dead_lettering_on_message_expiration = false,
    alarm : {
      message_threshold = 25,
      team : "team1"
    }
  },
  "queue-2" = {
    namespace_name                       = "namespaceB",
    dead_lettering_on_message_expiration = true,
    alarm : {
      message_threshold = 0,
      operator          = "GreaterThan",
      team : "team2"
    }
  },
}
