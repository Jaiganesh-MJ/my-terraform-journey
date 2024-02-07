variable "cidr_block_value" {
  description = "This is VPC CIDR"
  
}

variable "aws_subnet_cidr_value" {
  description = "This is subnet one CIDR"
  
}

variable "aws_subnet_cidr_value_2" {
  description = "This is subnet second CIDR"
  
}

variable "aws_rt_igw_cidr_allow" {
  description = "This is route table which will be publicly route"
}

resource "aws_vpc" "hugomainvpc" {
  cidr_block = var.cidr_block_value

  tags = {
    Name = "HugoVpc"
  }
}

resource "aws_subnet" "hugosub1" {
  vpc_id = aws_vpc.hugomainvpc.id
  cidr_block = var.aws_subnet_cidr_value
 tags = {
   Name = "hugosub1"
 }
}

resource "aws_subnet" "hugosub2" {
  vpc_id = aws_vpc.hugomainvpc.id
  cidr_block = var.aws_subnet_cidr_value_2
 tags = {
   Name = "hugosub2"
 }
}

resource "aws_internet_gateway" "hugoigw" {
  vpc_id = aws_vpc.hugomainvpc.id
}

resource "aws_route_table" "hugort" {
  vpc_id = aws_vpc.hugomainvpc.id

  route {
    cidr_block = var.aws_rt_igw_cidr_allow
    gateway_id = aws_internet_gateway.hugoigw.id
  }
  tags = {
    Name = "hugoigw"
  } 
}

resource "aws_route_table_association" "hugosubasso" {
  subnet_id = aws_subnet.hugosub1.id
  route_table_id = aws_route_table.hugort.id
}