resource "aws_vpc" "custom_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "customVpc"
  }
}

resource "aws_subnet" "custom_subnet1" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "customSubnet1"
  }
}

resource "aws_subnet" "custom_subnet2" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "customSubnet2"
  }
}

resource "aws_db_subnet_group" "sub_grp" {
  name       = "mycutsubnet"
  subnet_ids = [
    aws_subnet.custom_subnet1.id,
    aws_subnet.custom_subnet2.id
  ]

  tags = {
    Name = "My db subnet group"
  }
}

resource "aws_secretsmanager_secret" "rds_secret" {
  name        = "book-rds-secret"
  description = "RDS credentials for book-rds instance"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = "Cloud123"
    engine   = "mysql"
    dbname   = "mydb"
    port     = 3306
  })
}


# data "aws_secretsmanager_secret" "rds_secret" {
#   name = "book-rds-secret"
# }

# data "aws_secretsmanager_secret_version" "rds_secret_version" {
#   secret_id = data.aws_secretsmanager_secret.rds_secret.id
# }

resource "aws_db_instance" "default" {
  identifier               = "book-rds"
  allocated_storage        = 10
  db_name                  = "mydb"
  engine                   = "mysql"
  engine_version           = "8.0"
  instance_class           = "db.t3.micro"
  username = jsondecode(aws_secretsmanager_secret_version.rds_secret_version.secret_string)["username"]
  password = jsondecode(aws_secretsmanager_secret_version.rds_secret_version.secret_string)["password"]

  db_subnet_group_name     = aws_db_subnet_group.sub_grp.name
  parameter_group_name     = "default.mysql8.0"
  backup_retention_period  = 7
  backup_window            = "02:00-03:00"
  maintenance_window       = "sun:04:00-sun:05:00"
  deletion_protection      = true
  skip_final_snapshot      = true
  publicly_accessible      = false

  depends_on = [aws_db_subnet_group.sub_grp]
}
