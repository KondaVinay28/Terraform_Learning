provider "aws" {
  region = var.aws_region
}
# Call child module
module "web_server_root" {
  source = "./modules/compute"
  ami_value_child = var.ami_value_root
  # Pass the value from .tfvars
  instance_type_child = var.instance_type_root
  # Use ${terraform.workspace} to dynamically generate the tag
  server_name_child = "${terraform.workspace}-ec2-instance"
}