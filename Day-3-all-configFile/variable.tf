

variable "amiId"{
 description = "Give value to AMI"
 type=string
 default = "ami-0c803b171269e2d72"
}


variable "instanceType"{
    type=string
    default="t2.micro"
}