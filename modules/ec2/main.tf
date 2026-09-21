# Create an ec2 instance
resource "aws_instance" "module_ec2_instance" {
  ami                         = var.ami_value
  instance_type               = var.instance_type_value
  associate_public_ip_address = var.public_ip_address
  availability_zone           = var.zone
  key_name                    = var.keypair_name
  tags                        = var.Instance_name
}
