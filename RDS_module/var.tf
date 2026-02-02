variable "vpc_id" {
  type = string
  description = "the id of vpc "
}

variable "vpc_cidr" {
  type = string
  description = "the  ip of vpc "
}

variable "RDS_subnet_id" {
  type = list(string)
  description = "specify which private subnet through id"
}