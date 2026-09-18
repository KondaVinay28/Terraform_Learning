#------------------------------------- CREATE RESOURCES BELOW -------------------------------
# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "${local.env_name}-Terraform-vpc"
  }
}
# Create a subnet 
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = local.public_subnet1_cidr
  depends_on        = [aws_vpc.my_vpc]
  availability_zone = "us-east-1a"
  tags = {
    Name = "${local.env_name}-terraform-subnet"
  }
}
# Create an EC2 Instance with our custom vpc id
resource "aws_instance" "my_instance" {
  ami                         = "ami-0b6d9d3d33ba97d99"
  instance_type               = var.instance_type
  count                       = var.instance_count
  associate_public_ip_address = var.public_ip # To enable public IP
  subnet_id                   = aws_subnet.my_subnet.id
  depends_on                  = [aws_subnet.my_subnet]
  key_name                    = "awsKey2"
  tags                        = var.instance_name_env
}

# Create IAM users
# resource "aws_iam_user" "user_iam" {
#   count = length(var.users)// 3
#   name = var.users[count.index]
# }