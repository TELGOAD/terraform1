terraform {
  backend "s3" {
    bucket = "mybauckt2222"
    key    = "terraform.tfstate"
    region = "us-east-2"
    object_lock_enabled=true
  }
}
