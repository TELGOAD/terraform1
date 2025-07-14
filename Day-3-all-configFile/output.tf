



output "ip"{
    value=aws_instance.name.public_ip
}


output "vpc"{
    value=aws_instance.name1.public_ip
}