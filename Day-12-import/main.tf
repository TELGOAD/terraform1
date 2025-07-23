



resource "aws_instance" "name"{
    ami="ami-0cd582ee8a22cc7be"
    instance_type="t2.micro"
    tags={
        Name="manually"
    }
}

resource "aws_s3_bucket" "name"{
    
}