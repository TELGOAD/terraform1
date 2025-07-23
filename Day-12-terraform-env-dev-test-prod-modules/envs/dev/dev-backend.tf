
terraform {
  backend "s3" {
    bucket         = "adtbuckt1219"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    use_lockfile = true
    
  }
}
