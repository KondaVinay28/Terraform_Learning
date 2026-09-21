output "ec2_instance_public_ip" {
  description = "Public Ip of the ec2 instance"
  value       = aws_instance.module_ec2_instance.public_ip
}
