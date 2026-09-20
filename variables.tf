#--------------------------------CREATE VARIABLES BELOW------------------------------------

# Create a Variable(string)
variable "instance_type" {
  description = "Instance type" //Optional
  type        = string          //optional
  default     = "t3.micro"      //optional
}

# Create a count variable(number)
variable "instance_count" {
  description = "Number of instances"
  type        = number
  default     = 1
}

# Create a public_ip variable(boolean)
variable "public_ip" {
  description = "Assign public IP for the instance"
  type        = bool
  default     = true
}

# Variables for IAM users, uncomment this if you use count using list(strings)
# variable "users" {
#   description = "List of IAM users"
#   type = list(string)
#   default = [ "user1", "user2", "user3" ] 
# }

# Create IAM users using set(strings), uncomment this if you use for_each loop using set(strings)
# variable "users" {
#   description = "List of IAM users"
#   type        = set(string)
#   default     = ["user1", "user2", "user3"]
# }

# Instance name variable 
# variable "instance_name" {
#   description = "Name for the EC2 Instance"
#   type = string
#   default = "Terraform-Instance"
# }

# # Environment Variable
# variable "instance_environment" {
#   description = "Dev environment"
#   type = string
#   default = "Dev"
# }

# Instead of declaring tags in separate we can do this
variable "instance_name_env" {
  description = "Instance name and env"
  type        = map(string)
  default = {
    "Name" = "Terraform-Instance"
    "env"  = "Dev"
  }
}

# for expressions demo
variable "users" {
  description = "List of IAM users"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

# For Dynamic Blocks
variable "ingress_rules" {
  type = list(object({
    port        = number
    description = string
    cidr_blocks = list(string)
  }))
  default = [
    { port = 22, description = "SSH from anywhere", cidr_blocks = ["0.0.0.0/0"] },
    { port = 80, description = "For the nginx server", cidr_blocks = ["0.0.0.0/0"] }
  ]
}