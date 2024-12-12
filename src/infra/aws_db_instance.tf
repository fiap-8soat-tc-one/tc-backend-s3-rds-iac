resource "aws_db_instance" "db-tc-backends3" {
  identifier          = var.db_identifier
  engine              = var.db_engine
  engine_version      = var.engine_version
  instance_class      = var.instance_type
  allocated_storage   = var.allocated_storage
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  publicly_accessible = var.publicly_accessible
  storage_type        = var.storage_type
  multi_az            = var.multi_az
  skip_final_snapshot = var.skip_final_snapshot
  vpc_security_group_ids = [aws_security_group.security-group-database.id]
}
