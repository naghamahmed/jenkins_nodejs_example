#passing values through enviroment variables

variable "RDS_USERNAME" {
  description = "The username for the DB master user"
  type        = string
  sensitive   = true
}

variable "RDS_PASSWORD" {
  description = "The password for the DB master user"
  type        = string
  sensitive   = true
}
