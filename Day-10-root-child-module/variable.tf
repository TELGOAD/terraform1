variable "cidr_block"{
 type = string
 default = "10.0.0.0/16"
}




variable "subnet_cidr"{
    type = string
    default = "10.0.1.0/24"
}



variable "az" {
  type = string
  default = "us-east-2a"
}

variable "ami_id" {
  default = "ami-0c803b171269e2d72" 
  type = string
}

variable "instance_type" {
  type = string
  default="t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "db_name" {
  type = string
  default = "mydb"
}
variable "db_user" {
    type = string
    default = "admin"
  
}
variable "db_password" {
  type = string
  default = "Admin12345"
}