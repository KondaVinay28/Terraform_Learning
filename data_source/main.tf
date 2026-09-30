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
# Resource or modules migration
moved {
  from = aws_instance.example
  to = aws_instance.example_example
}
# Create an EC2 instance
resource "aws_instance" "example_example" {
  ami                         = data.aws_ami.custom_ami.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.custom_subnet.id
  user_data_replace_on_change = true
  # templatefile
  # user_data = templatefile("/Users/vinaykonda/Desktop/Terraform_Learning/install.sh.tftpl", {
  #   environment_name = "Production"
  # })

  # create_before_destroy rule
  # lifecycle {
  #   create_before_destroy = true
  # }

  # prevent_destroy rule
  # lifecycle {
  #   prevent_destroy = false
  # }

  # ignore_changes rule
  # lifecycle {
  #   ignore_changes = [ tags ]
  # }
  tags = {
    Name        = "Data-Source-Instance"
    Environment = "Prod"
  }
}

#Null Resource
# resource "null_resource" "example_resource" {
# Triggers everytime we run the tf plan or apply
#   triggers = {
#     id = timestamp()
#   }
#   provisioner "local-exec" {
#     command = "echo Hello from Null resource > notes.md"
#   }
# }