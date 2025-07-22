



module "project"{

    source="github.com/CloudTechDevOps/terraform0730am/Day-9-modules"
    instance_type = "t2.nano"
    #key = "bujjiKey"
    ami_id  = "ami-05ffe3c48a9991133"
    az = "us-east-1a"
}