#-----------------------------------CREATE LOCALS HERE---------------------------------------
locals {
  env_name = "Dev"
}

locals {
  public_subnet1_cidr = "10.0.1.0/24"
}
# Dynamic Blocks using locals
locals {
  inbound_rules = [ 
		{ port = 22, protocol = "tcp", desc = "SSH Access", cidr_block = "0.0.0.0/0"},
		{ port = 80, protocol = "tcp", desc = "HTTP Access", cidr_block = "0.0.0.0/0" }
	]
}  