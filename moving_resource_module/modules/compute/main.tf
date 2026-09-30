resource "aws_instance" "my_server_new" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  subnet_id     = "subnet-011a09e93798da16a"

  tags = {
    Name = "resource-to-module-instance"
  }
}