variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_value_root" {
  type = string
  default = "ami-0b6d9d3d33ba97d99"
  
}
variable "instance_type_root" {
  type        = string
  description = "Instance size read from the environment .tfvars file"
}