

resource "aws_instance" "name"{
 instance_type = "t2.nano"
     ami = "ami-0eb9d6fc9fab44d24"
    
}

resource "aws_s3_bucket" "name"{
    bucket="adt12119191"

}