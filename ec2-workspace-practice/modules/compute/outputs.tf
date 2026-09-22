output "public_ip_child" {
  value = aws_instance.my_server_child.public_ip
}

output "environment_name_child" {
  value = terraform.workspace
}