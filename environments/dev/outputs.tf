output "root_public_ip" {
  description = "Have to define outputs in two places when using modules"
  value       = module.ec_instance.ec2_instance_public_ip
}
