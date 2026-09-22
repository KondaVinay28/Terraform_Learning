provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami               = "ami-0b6d9d3d33ba97d99"
  instance_type     = "t3.micro"
  availability_zone = "us-east-1a"
  subnet_id         = "subnet-011a09e93798da16a"
  tags = {
    Name = "${terraform.workspace}-Instance"
  }
}