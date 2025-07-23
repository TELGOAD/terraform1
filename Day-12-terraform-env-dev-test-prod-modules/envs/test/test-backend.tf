
terraform {
  backend "s3" {
    bucket         = "adtbuckt12"
    key            = "test/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile = true
  }
}
