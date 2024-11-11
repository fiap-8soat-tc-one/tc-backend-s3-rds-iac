provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "fiap-2bdc9c48"
    key    = "terraform/states/rds.tfstate"
    region = "us-east-1"
  }
}

resource "aws_security_group" "rds_security_group" {
  name        = "rds-postgres-security-group"
  description = "Allow inbound traffic to RDS instance"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = var.db_allocated_storage
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres16"
  publicly_accessible  = var.publicly_accessible

  vpc_security_group_ids = [aws_security_group.rds_security_group.id]

  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = true

  tags = {
    Name        = "Fiap8SoatTeam32"
    Environment = var.environment
  }
}

output "db_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "db_username" {
  value = aws_db_instance.postgres.username
}

output "db_password" {
  value = var.db_password
}
