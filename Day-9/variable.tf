

variable "amiId" {
  description = "ami value for instance creation"
  default = "ami-0c803b171269e2d72"
  type=string
}

variable "awsInstanceType"{
    description = "aws instance type"
    default="t2.micro"
    type=string
}

variable "key"{
    default = "bujjiKey"
    type = string
}

variable "az"{
    default="us-east-2a"
    type = string
}

variable "bucketName"{
    type = string
    #default = "dhfadkjfhlkj"
}