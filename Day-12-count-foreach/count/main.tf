

variable "env" {
  type=list(string)
  default = ["dev","prod"]
}

resource "aws_instance" "name"{
     instance_type = "t2.nano"
     ami = "ami-0eb9d6fc9fab44d24"
     count = length(var.env)
     tags = {
       Name=var.env[count.index]
     }
}