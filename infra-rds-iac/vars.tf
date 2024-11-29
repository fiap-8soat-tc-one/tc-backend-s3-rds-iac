variable "db_username" {
  description = "DB Username"
  type        = string
}

variable "db_password" {
  description = "DB Password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "database name"
  type        = string
  default     = "db-tc-backends3"
}

variable "instance_type" {
  description = "Type Instance RDS"
  type        = string
  default     = "db.t4g.micro"
}

variable "database-role" {
  default = "arn:aws:iam::763375054615:role/aws-service-role/rds.amazonaws.com/AWSServiceRoleForRDS"
}