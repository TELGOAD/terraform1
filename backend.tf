terraform {
  backend "s3" {
    bucket = "mybauckt2222"
    key    = "terraform.tfstate"
    region = "us-east-2"
    use_lockfile = true
  }
}
