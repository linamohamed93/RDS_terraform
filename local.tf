provider "aws" {
  region = "us-east-2"  
}

module "create_rds" {
  source = "./RDS_module"

 vpc_id="vpc-045aeda71ff7d5aa2"
 vpc_cidr="172.31.0.0/16"
 RDS_subnet_id=["subnet-07ea85f56b603d81f","subnet-04d32ad6ff76e6de6"]
}

