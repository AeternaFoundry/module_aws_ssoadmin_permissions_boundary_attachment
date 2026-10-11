output "ssoadmin_permissions_boundary_attachments_id" {
  description = "Map of id values across all ssoadmin_permissions_boundary_attachments, keyed the same as var.ssoadmin_permissions_boundary_attachments"
  value       = { for k, v in aws_ssoadmin_permissions_boundary_attachment.ssoadmin_permissions_boundary_attachments : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ssoadmin_permissions_boundary_attachments_instance_arn" {
  description = "Map of instance_arn values across all ssoadmin_permissions_boundary_attachments, keyed the same as var.ssoadmin_permissions_boundary_attachments"
  value       = { for k, v in aws_ssoadmin_permissions_boundary_attachment.ssoadmin_permissions_boundary_attachments : k => v.instance_arn if v.instance_arn != null && length(v.instance_arn) > 0 }
}
output "ssoadmin_permissions_boundary_attachments_permission_set_arn" {
  description = "Map of permission_set_arn values across all ssoadmin_permissions_boundary_attachments, keyed the same as var.ssoadmin_permissions_boundary_attachments"
  value       = { for k, v in aws_ssoadmin_permissions_boundary_attachment.ssoadmin_permissions_boundary_attachments : k => v.permission_set_arn if v.permission_set_arn != null && length(v.permission_set_arn) > 0 }
}
output "ssoadmin_permissions_boundary_attachments_permissions_boundary" {
  description = "Map of permissions_boundary values across all ssoadmin_permissions_boundary_attachments, keyed the same as var.ssoadmin_permissions_boundary_attachments"
  value       = { for k, v in aws_ssoadmin_permissions_boundary_attachment.ssoadmin_permissions_boundary_attachments : k => one(v.permissions_boundary) if v.permissions_boundary != null && length(v.permissions_boundary) > 0 }
}
output "ssoadmin_permissions_boundary_attachments_region" {
  description = "Map of region values across all ssoadmin_permissions_boundary_attachments, keyed the same as var.ssoadmin_permissions_boundary_attachments"
  value       = { for k, v in aws_ssoadmin_permissions_boundary_attachment.ssoadmin_permissions_boundary_attachments : k => v.region if v.region != null && length(v.region) > 0 }
}

