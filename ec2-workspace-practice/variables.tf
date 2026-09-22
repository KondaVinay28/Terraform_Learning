variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "instance_type_root" {
  type        = string
  description = "Instance size read from the environment .tfvars file"
}