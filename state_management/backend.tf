terraform {
  backend "s3" {
    bucket       = "state-backend-bucket-23rd-sept"
    key          = "statefiles/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
