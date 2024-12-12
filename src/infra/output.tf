output "db_endpoint" {
  value = aws_db_instance.db-tc-backends3.endpoint
}

output "db_username" {
  value = var.db_username
}

output "db_password" {
  value     = var.db_password
  sensitive = true
}
