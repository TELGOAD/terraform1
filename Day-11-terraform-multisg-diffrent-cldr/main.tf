
variable "allowed_cidr_ports"{
    type = map(string)
    default={
        22="203.0.113.0/24"  
        80="0.0.0.0/0"  
        443="0.0.0.0/0"    
        8080="10.0.0.0/16"
        9000="192.168.1.0/24"
        3389="10.0.1.0/24"
    }
}

resource "aws_security_group" "devops_project"{
    name="dev_ops_project"
    description = "Allow restricted"
    dynamic "ingress"{
        for_each = var.allowed_cidr_ports
        content {
          description="Allow access to port ${ingress.key}"
          from_port=ingress.key
          to_port=ingress.key
          protocol="tcp"
          cidr_blocks = [ingress.value]
        }
    }

    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags={
        Name="devops-project"
    }

}
