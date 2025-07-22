

resource "aws_instance" "name"{
    ami = "ami-0c803b171269e2d72"
    instance_type = "t2.micro"
    tags = {
      Name="test"
    }


# lifecycle {
#   create_before_destroy=true
# }
# lifecycle {
#   prevent_destroy=true
# }
# lifecycle {
#   ignore_changes=[

#   ]
# }


}

