resource "aws_db_instance" "jhy_mydb" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  name                    = "mydb"
  identifier              = "mydb"
  username                = "admin"
  password                = "It12345!"
  parameter_group_name    = "default.mysql8.0"
  availability_zone       = "ap-northeast-2a"
  db_subnet_group_name    = aws_db_subnet_group.jhy_dbsn.id
  vpc_security_group_ids  = [aws_security_group.jhy_websg.id]
  skip_final_snapshot     = true
    tags  = {
      name  = "jhy-mydb"
    }
}

resource "aws_db_subnet_group" "jhy_dbsn" {
  name = "jhy-dbsb-group" 
  subnet_ids = [aws_subnet.jhy_pridba.id,aws_subnet.jhy_pridbc.id]  
  tags = {
    name = "jhy-dbsb-group"
  }
}