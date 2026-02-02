locals {
  rds_cred = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_value.secret_string)
  
}