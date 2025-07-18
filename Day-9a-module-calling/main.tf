

module "awsInstace" {
    source="../Day-9"
    awsInstanceType = "t2.micro"
    #key = "bujjiKey"
    az = "us-east-2a"
    amiId="ami-0c803b171269e2d72"
}