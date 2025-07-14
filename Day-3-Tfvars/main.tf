


resource "aws_instance" "name"{
    ami = var.amiId
    instance_type = var.instanceType

} 


