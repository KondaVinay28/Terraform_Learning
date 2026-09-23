provider "aws" {
  region = "us-east-1"
}
# Create an s3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "state-backend-bucket-23rd-sept"
}

resource "aws_instance" "Vinay_Instance" {
  ami                         = "ami-0b6d9d3d33ba97d99"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  subnet_id                   = "subnet-011a09e93798da16a"
  availability_zone           = "us-east-1a"
  tags = {
    Name        = "state_Instance",
    Environment = "Dev"
  }
}
