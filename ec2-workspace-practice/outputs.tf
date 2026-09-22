output "current_workspace" {
  value       = module.web_server_root.environment_name_child
  description = "The active workspace from the child module"
}

output "ec2_public_ip" {
  value       = module.web_server_root.public_ip_child
  description = "Public IP from the child module"
}