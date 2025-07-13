resource "aws_instance" "name" {
  ami = "ami-0c803b171269e2d72"
  instance_type = "t2.nano"
  key_name = "bujjiKey"
  tags = {
    
    Name="day-51"
  }
}


resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_vpc" "name1" {
  cidr_block = "10.0.0.0/24"
}



