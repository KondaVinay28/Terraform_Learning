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

# Create Internet Gateway
resource "aws_internet_gateway" "my-igw" {
  tags = {
    Name = "terraform-igw"
  }
}

# Attach Internet Gateway to the VPC
resource "aws_internet_gateway_attachment" "my_igw_attachement" {
  internet_gateway_id = aws_internet_gateway.my-igw.id
  vpc_id              = aws_vpc.my_vpc.id
  depends_on          = [aws_internet_gateway.my-igw]
}

# Create a security group with ingress rule port 22 and egress all open
resource "aws_security_group" "my_sg" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "terraform-sg"
  description = "Security Group"
  # Inbound Rules
  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Outbound Rules
  egress {
    description = "All traffice outbound access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-sg"
  }
}

# Create Route Table
resource "aws_route_table" "name" {
  vpc_id     = aws_vpc.my_vpc.id
  depends_on = [aws_internet_gateway_attachment.my_igw_attachement]
  # Edit route so that igw is allowed all incoming traffic
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
  tags = {
    Name = "terraform-rt"
  }
}
# Associate subnet to route table
resource "aws_route_table_association" "my_rt_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.name.id

}
# Using key-pair generated using ssh-keygen
resource "aws_key_pair" "my_key_pair" {
  key_name   = "terraform-key"
  public_key = file("/Users/vinaykonda/terraformKey.pub")
}
# Create an EC2 Instance with our custom vpc id
resource "aws_instance" "my_instance" {
  ami                         = "ami-0b6d9d3d33ba97d99"
  instance_type               = var.instance_type
  count                       = var.instance_count
  associate_public_ip_address = var.public_ip # To enable public IP
  subnet_id                   = aws_subnet.my_subnet.id
  depends_on                  = [aws_subnet.my_subnet]
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  # key_name                    = "awsKey2" # use this if you have an existing key-pair in aws cloud
  key_name = aws_key_pair.my_key_pair.key_name
  tags     = var.instance_name_env
}

# Create IAM users using count and list(string)
# resource "aws_iam_user" "user_iam" {
#   count = length(var.users)// 3
#   name = var.users[count.index]
# }

# Creating IAM users using for_each and set(string)
# resource "aws_iam_user" "user_iam" {
#   for_each = var.users
#   name     = each.value
# }