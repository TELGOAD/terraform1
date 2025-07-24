

resource "aws_vpc" "topfuvpc"{
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="topuVPC"
  }
}

resource "aws_subnet" "name" {
  vpc_id = aws_vpc.topfuvpc.id
  cidr_block = "10.0.0.0/24"
}