resource "aws_db_instance" "db-tc-backends3" {
  identifier          = "db-tc-backends3"
  engine              = "postgres"
  engine_version      = "16.3"
  instance_class      = var.instance_type
  allocated_storage   = 20
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  publicly_accessible = true
  storage_type        = "gp2"
  multi_az            = false
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.security-group-database.id]
}