
provider "aws"{
    region = "us-west-2"
}

resource "aws_s3_bucket" "name" {
  bucket = "djhfkjafdhlkjfhlkj"
}

# variable "create_bucket" {
#   description = "set to true"
#   type = bool
#   default = false
# }

# resource "aws_s3_bucket" "example" {
#   bucket = "dfhakjfdlk"
#   count = var.create_bucket ? 1:0
#  # acl="private"
#   #acceleration_status = 
#   tags = {
#     Name="ConditionBucket"
#   }
# }


variable "aws_region" {
  description = "The region in which to create the ins"
  type = string
  default = "us-west-2"
  validation {
    condition = var.aws_region=="us-west-1" || var.aws_region == "eu-west-1"
    error_message = "error occur create only in us west"
  }
}




