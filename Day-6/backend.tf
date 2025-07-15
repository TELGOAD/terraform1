

terraform {
   #required_version = ">=1.10" this will allow to work same terraform version only 
  backend "s3" {
    bucket = "mybauckt2222"
    key    = "day1/terraform.tfstate"
    region = "us-east-2"
    use_lockfile = true
  }
}
