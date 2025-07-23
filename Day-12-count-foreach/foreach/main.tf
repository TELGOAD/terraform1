

variable "ami" {
  type = string
  default = ""
}
variable "instance_type" {
  type=string
  default = "t2.micro"
}

variable "env"{
    type=list(string)
    default=["one","three"]
}

resource "aws_instance" "name" {
     instance_type = "t2.nano"
     ami = "ami-0eb9d6fc9fab44d24"
     for_each = toset(var.env)
     tags = {
       Name=each.value
     }
  
}