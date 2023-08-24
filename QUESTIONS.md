# QUESTIONS

- [ ] What are best practices for namespaces? Why would different teams share the same namespace
- [ ] How to link generic resource and share them with other team repositories? I believe I would need a remote state?
- [ ] What is a best practice to have a dictionary for `namespace_id_map` and `alarm_team_id_map`? I would've liked to have this 'imported' someway based on the main `main.tf` file
- [ ] For now I "simulated" that each service_X directory is a seperate repository. However would it be possible to still keep the `tf` files in sync with each other?
- [ ] How can I achieve setting multiple alarms? Can I create a nested resource? (See below snippet for what I would've liked to have done)

```tf
variable "queues_config" {
  description = "Configuration for queues"

  type = map(object({
    namespace_name                       = string
    dead_lettering_on_message_expiration = bool
    alarm = optional(list(object({
      message_threshold = number
      team              = string # @todo add validation
      operator          = string
    })))
  }))
}
```
