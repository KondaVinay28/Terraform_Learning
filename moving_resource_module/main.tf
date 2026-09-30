provider "aws" {
  region = "us-east-1"
}

moved {
  from = aws_instance.my_server_new
  to = module.compute.aws_instance.my_server_new
}
# Call child module
module "compute" {
  source = "./modules/compute"
}
# old code --- created instance using below code
# resource "aws_instance" "my_server_new" {
#   ami           = "ami-0b6d9d3d33ba97d99"
#   instance_type = "t3.micro"
#   subnet_id     = "subnet-011a09e93798da16a"

#   tags = {
#     Name = "resource-to-module-instance"
#   }
# }