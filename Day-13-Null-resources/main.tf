



resource "aws_db_instance" "mysql_rds"{

identifier = "my-sql-db"
engine = "mysql"
instance_class="db.t3.micro"
username = "admin"
password = "password123"
db_name="dev"
allocated_storage = 20
skip_final_snapshot = true
publicly_accessible = true
}

resource "null_resource" "local_sql_exec" {
  depends_on = [ aws_db_instance.mysql_rds ]

  provisioner "local-exec" {
    command = "my-sql -h ${aws_db_instance.mysql_rds.address} -u admin -ppassword123 dev < init.sql"
  }
  triggers = {
    always_run = timestamp()
  }
}



  