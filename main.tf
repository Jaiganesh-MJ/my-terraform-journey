provider "aws" {
  region = "eu-west-1"
}

module "vpc_creation" {
  source = "./modules/vpc"
  cidr_block_value = "10.0.0.0/16"
  aws_subnet_cidr_value = "10.0.1.0/24"
  aws_subnet_cidr_value_2 = "10.0.2.0/24"  
  aws_rt_igw_cidr_allow = "0.0.0.0/0"
}