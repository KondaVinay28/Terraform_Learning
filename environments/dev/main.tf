module "ec_instance" {
  source              = "../../modules/ec2"
  ami_value           = "ami-0b6d9d3d33ba97d99"
  instance_type_value = "t3.micro"
  public_ip_address   = true
  zone                = "us-east-1a"
  keypair_name        = "awsKey2"
  Instance_name = {
    Name = "Terraform_module_ec2_instance"
  }
}
