# Public IP of the ec2 instance
output "my_instance_IP" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.my_instance[0].public_ip # Use * instead of 0 to get all instances public ip
}

# VPC Id
output "VPC_ID" {
  description = "The VPC Id"
  value       = aws_vpc.my_vpc.id
}