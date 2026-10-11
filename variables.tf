variable "ssoadmin_permissions_boundary_attachments" {
  description = <<EOT
Map of ssoadmin_permissions_boundary_attachments, attributes below
Required:
    - instance_arn
    - permission_set_arn
    - permissions_boundary (block):
        - customer_managed_policy_reference (optional, block):
            - name (required)
            - path (optional)
        - managed_policy_arn (optional)
Optional:
    - region
EOT

  type = map(object({
    instance_arn       = string
    permission_set_arn = string
    region             = optional(string)
    permissions_boundary = object({
      customer_managed_policy_reference = optional(object({
        name = string
        path = optional(string)
      }))
      managed_policy_arn = optional(string)
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.ssoadmin_permissions_boundary_attachments : (
        v.permissions_boundary.managed_policy_arn == null || (length(v.permissions_boundary.managed_policy_arn) >= 0 && length(v.permissions_boundary.managed_policy_arn) <= 2048)
      )
    ])
    error_message = "must be between 0 and 2048 characters"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

