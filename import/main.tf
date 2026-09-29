provider "aws" {
  region = "us-east-1"  
}
# import block
# import {
#   id = "Instance_ID"
#   to = aws_instance.imported_instance
# }
# 1. run `terraform plan -generate-config-out=generated_resources.tf`
# 2. copy from the above file and paste in main.tf like below and remove import block
# 3. run `terraform plan` and we see 1 to add because we dont have any state file yet and remove code from main.tf if you see errors when you run tf plan
# 4. To generate state file run `terraform import aws_instance.imported_instance <instance_ID>`
# 5. Finally run `terraform plan and you can see no changes `

resource "aws_instance" "imported_instance" {
  ami                                  = "ami-0b6d9d3d33ba97d99"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1a"
  # disable_api_stop                     = false
  # disable_api_termination              = false
  # ebs_optimized                        = true
  # force_destroy                        = false
  # get_password_data                    = false
  # hibernation                          = false
  # instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  key_name                             = "terraform_key_import"
  monitoring                           = false
  placement_partition_number           = 0
  private_ip                           = "172.31.12.89"
  region                               = "us-east-1"
  secondary_private_ips                = []
  security_groups                      = ["launch-wizard-1"]
  source_dest_check                    = true
  subnet_id                            = "subnet-011a09e93798da16a"
  tags = {
    Name = "import-instance"
  }
  tags_all = {
    Name = "import-instance"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-07336a5ed9274da9a"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}
