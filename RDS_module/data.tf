// create secret manger to save the user and password of RDS database
data "aws_secretsmanager_secret" "rds_secret" {
  arn = "arn:aws:secretsmanager:us-east-2:268811324951:secret:RDS_SEC-78ZzXY"
}
 data "aws_secretsmanager_secret_version" "rds_secret_value" {
  secret_id     = data.aws_secretsmanager_secret.rds_secret.id  
}