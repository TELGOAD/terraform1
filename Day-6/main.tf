resource "aws_vpc" "myVPc" {
    cidr_block = "10.0.0.0/16"
    tags={
        Name="devVpc"
    }


}