resource "aws_instance" "my_server_child" {
  ami = var.ami_value_child
  instance_type = var.instance_type_child
  tags = {
  Name = var.server_name_child
  }
}