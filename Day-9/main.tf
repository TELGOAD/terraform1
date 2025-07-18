resource "aws_instance" "name" {
  ami = var.amiId
  instance_type = var.awsInstanceType
  key_name = var.key
  tags = {
    
    Name="day-51"
  }
  availability_zone = var.az
}

resource "aws_s3_bucket" "name"{
    bucket = var.bucketName
}


