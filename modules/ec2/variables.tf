variable "ami_value" {
  description = "AMI value for the ec2 instance"
  type        = string
}

variable "instance_type_value" {
  description = "ec2 instance type"
  type        = string
}

variable "public_ip_address" {
  description = "Enable public ip for the ec2 instance"
  type        = bool
}

variable "zone" {
  description = "Availability Zone for the ec2 instance"
  type        = string
}

variable "keypair_name" {
  description = "Key pair for the instance"
  type        = string
}

variable "Instance_name" {
  description = "ec2 Instance Name"
  type        = map(string)
}
