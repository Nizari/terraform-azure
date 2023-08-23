# QUESTIONS

- [ ] What are best practices for namespaces? Why would different teams share the same namespace
- [ ] How to link generic resource and share them with other team repositories? I believe I woudl need a remote state?
- [ ] How can I achieve setting multiple alarms? Can I create a nested resource?

```tf
  type = map(object({
    namespace_name                       = string
    dead_lettering_on_message_expiration = bool
    monitor_settings = optional(list(object({
      message_threshold = number
    })))
  }))
```
