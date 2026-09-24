provider "aws" {
  region = "us-east-1"
}
# Pull latest Ubuntu AMI using Data Source
data "aws_ami" "custom_ami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
# Pull existing subnet using data source by tag name
data "aws_subnet" "custom_subnet" {
  filter {
    name   = "tag:Name"
    values = ["subnet-us-east-1a"]
  }
}
# Create an EC2 instance
resource "aws_instance" "example_instance" {
  ami                         = data.aws_ami.custom_ami.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.custom_subnet.id
  tags = {
    Name = "Data-Source-Instance"
  }
}