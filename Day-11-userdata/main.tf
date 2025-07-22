resource "aws_instance" "ec2Instance"{
    instance_type="t2.micro"
        ami = "ami-0eb9d6fc9fab44d24"
        user_data=file("test.sh")
}