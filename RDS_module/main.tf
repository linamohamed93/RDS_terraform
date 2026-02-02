
// create securty group to limit resources
resource "aws_security_group" "rds_sg" {
  name   = "rds-sg"
  vpc_id = var.vpc_id
// allow to reach the database inside the vpc through 3306
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]  //allow within ip vpc
  }

}

// create DB Subnet Group with subnet 
resource "aws_db_subnet_group" "single_subnet" {
  name       = "rds-single-subnet"
  subnet_ids = var.RDS_subnet_id

  tags = {
    Name = "Single Subnet RDS"
  }
}

// create RDS database
resource "aws_db_instance" "rds" {
  allocated_storage    = 20  
  engine               = "mysql"
  engine_version       = "8.0"  
  instance_class       = "db.t3.micro"      
  db_name              = "RDSdb"  
  skip_final_snapshot  = true     


  vpc_security_group_ids = [aws_security_group.rds_sg.id]  
  db_subnet_group_name   = aws_db_subnet_group.single_subnet.name

  
  username = local.rds_cred.username
  password = local.rds_cred.password
}
