resource "aws_vpc" "skillup_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = var.vpc_tagging
}

resource "aws_internet_gateway" "skillup_internet_gateway" {
  vpc_id = aws_vpc.skillup_vpc.id

  tags = var.internet_gateway_tags
}


#PUBLIC SUBNET A
resource "aws_subnet" "skillup_public_subnet_1za" {
   vpc_id = aws_vpc.skillup_vpc.id
   cidr_block = var.skillup_public_subnet_a_cidr
   map_public_ip_on_launch = true
   availability_zone = "ap-southeast-2a"
  
  tags = var.public_subnet_a
}

#PUBLIC SUBNET B
resource "aws_subnet" "skillup_public_subnet_1zb" {
  vpc_id                  = aws_vpc.skillup_vpc.id
  cidr_block              = var.skillup_public_subnet_b_cidr
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-2b"

  tags = var.public_subnet_b
}


#PRIVATE SUBNET A
resource "aws_subnet" "skillup_private_subnet_1za" {
   vpc_id = aws_vpc.skillup_vpc.id
   cidr_block = var.skillup_private_subnet_a_cidr
   map_public_ip_on_launch = false
   availability_zone = "ap-southeast-2a"
  
  tags = var.private_subnet_a
}

#PRIVATE SUBNET B
resource "aws_subnet" "skillup_private_subnet_1zb" {
  vpc_id                  = aws_vpc.skillup_vpc.id
  cidr_block              = var.skillup_private_subnet_b_cidr
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-2b"

  tags = var.private_subnet_b
}


#ELASTIC IP
resource "aws_eip" "eip_nat" {
  domain = "vpc"
  tags = var.elastic_ip_nat
}

#NAT GATEWAY
resource "aws_nat_gateway" "skillup_nat" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.skillup_public_subnet_1za.id

  tags = var.nat_tags
}

#PUBLIC ROUTE TABLE
resource "aws_route_table" "skillup_public_route" {
  vpc_id = aws_vpc.skillup_vpc.id
  tags = var.public_route_table
}

#PRIVATE ROUTE TABLE
resource "aws_route_table" "skillup_private_route" {
  vpc_id = aws_vpc.skillup_vpc.id
  tags = var.private_route_table
}

#ROUTE ASSOCIATION
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.skillup_public_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.skillup_internet_gateway.id
}

resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.skillup_private_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.skillup_nat.id
}

resource "aws_route_table_association" "skillup_rt_assoc_public_1a" {
  subnet_id      = aws_subnet.skillup_public_subnet_1za.id
  route_table_id = aws_route_table.skillup_public_route.id
}

resource "aws_route_table_association" "skillup_rt_assoc_public_1b" {
  subnet_id      = aws_subnet.skillup_public_subnet_1zb.id
  route_table_id = aws_route_table.skillup_public_route.id
}

resource "aws_route_table_association" "skillup_rt_assoc_private_1a" {
  subnet_id      = aws_subnet.skillup_private_subnet_1za.id
  route_table_id = aws_route_table.skillup_private_route.id
}

resource "aws_route_table_association" "skillup_rt_assoc_private_1b" {
  subnet_id      = aws_subnet.skillup_private_subnet_1zb.id
  route_table_id = aws_route_table.skillup_private_route.id
}