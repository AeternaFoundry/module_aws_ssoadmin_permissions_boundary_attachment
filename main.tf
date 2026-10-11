resource "aws_ssoadmin_permissions_boundary_attachment" "ssoadmin_permissions_boundary_attachments" {
  for_each = var.ssoadmin_permissions_boundary_attachments

  instance_arn       = each.value.instance_arn
  permission_set_arn = each.value.permission_set_arn
  region             = each.value.region

  permissions_boundary {
    dynamic "customer_managed_policy_reference" {
      for_each = each.value.permissions_boundary.customer_managed_policy_reference != null ? [each.value.permissions_boundary.customer_managed_policy_reference] : []
      content {
        name = customer_managed_policy_reference.value.name
        path = customer_managed_policy_reference.value.path
      }
    }
    managed_policy_arn = each.value.permissions_boundary.managed_policy_arn
  }
}

