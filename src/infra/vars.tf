variable "db_username" {
  description = "DB Username"
  type        = string
  default     = "postgres"
}

variable "db_identifier" {
  description = "DB identifier"
  type        = string
  default     = "db-tc-backends3"
}

variable "db_engine" {
  description = "DB Engine"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "DB Password"
  type        = string
  sensitive   = true 
}

variable "db_name" {
  description = "database name"
  type        = string
  default     = "dbBackendS3"
}

variable "instance_type" {
  description = "Type Instance RDS"
  type        = string
  default     = "db.t4g.micro"
}

variable "engine_version" {
  description = "Engine version RDS"
  type        = string
  default     = "16.3"
}

variable "allocated_storage" {
  description = "Allocated storage RDS"
  type        = number
  default     = 20
}

variable "publicly_accessible" {
  description = "Publicly accessible RDS"
  type        = bool
  default     = true
}

variable "storage_type" {
  description = "Storage type RDS"
  type        = string
  default     = "gp2"
}

variable "multi_az" {
  description = "Mulit Az"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip snapshot"
  type        = bool
  default     = true
}

variable "security_group" {
  description = "Security Group RDS"
  type        = string
  default     = "db-backend-s3-sg"
}

variable "database-role" {
  default = "arn:aws:iam::763375054615:role/aws-service-role/rds.amazonaws.com/AWSServiceRoleForRDS"
}
