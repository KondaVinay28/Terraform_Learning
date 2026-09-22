resource "aws_instance" "my_server_child" {
  ami = "ami-0b6d9d3d33ba97d99" 
  instance_type = var.instance_type_child
  tags = {
  Name = var.server_name_child
  }
}