variable "ami_value_child" {
  type = string
  description = "AMI for the instance"
  
}
variable "instance_type_child" {
  type = string
  description = "EC2 instance size"
}
variable "server_name_child" {
  type = string
  description = "Name tag for the server"
}