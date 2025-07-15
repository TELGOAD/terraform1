

#Vpc Creation

resource "aws_vpc" "customVpc"{
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="test"
  }
}

#Subnet Creation
resource "aws_subnet" "customSubnet"{
  vpc_id = aws_vpc.customVpc.id
  tags = {
    Name="customSubnet"
  }
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-2a"
}


#create Internet Gateway
resource "aws_internet_gateway" "customInternetGateway"{
    tags = {
      Nane="cutomIT"
    }
    vpc_id = aws_vpc.customVpc.id
}

#create Route Table
resource "aws_route_table" "customRT"{
    vpc_id = aws_vpc.customVpc.id
    tags={
        name="cutomRT"
    }
    #Edit route table
    route  {
        cidr_block="0.0.0.0/0"
        gateway_id=aws_internet_gateway.customInternetGateway.id

    }
}
    #edite subnet association
resource "aws_route_table_association" "cutomSA" {
  subnet_id=aws_subnet.customSubnet.id
  route_table_id=aws_route_table.customRT.id
}



#create SG
resource "aws_security_group" "cutomSG"{
    vpc_id = aws_vpc.customVpc.id
    tags={
        Name="cutomSG"
    }
ingress  {
        cidr_blocks=["0.0.0.0/0"]     
        description="allow"
        from_port=22
        to_port=22
        protocol="TCP"
    }
ingress {
        cidr_blocks=["0.0.0.0/0"]
        protocol="TCP"
        from_port=22
        to_port=22
}

egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"

}
}

resource "aws_instance" "name" {
  ami = "ami-0c803b171269e2d72"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.customSubnet.id
  vpc_security_group_ids = [aws_security_group.cutomSG.id]
}


