
terraform {
  backend "s3" {
    bucket         = "adtbuckt1219"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile = true
  }
}
