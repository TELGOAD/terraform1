


resource "aws_instance" "name" {
 ami = var.amiId
 instance_type = var.instanceType
 tags={
    Name="Dev3"
 }
}


# resource "aws_instance" "name1"{
#     ami = var.amiId
#     instance_type = var.instanceType
#     tags={
#         Name="Day-5"
#     }
# }