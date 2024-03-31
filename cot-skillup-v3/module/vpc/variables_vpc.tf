#VPC TAGS
variable "vpc_tagging" {
  type        = map
  description = "VPC Tags"
  default     = {
    Name        = "skillup-vpc-m.balilo-001"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

variable "name" {
  description = "Name Tag"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

#PUBLIC SUBNET CIDR
variable "skillup_public_subnet_a_cidr" {
  description = "CIDR for Public subnet zone A"
  type        = string
  default     = "10.0.0.0/20"
}

variable "skillup_public_subnet_b_cidr" {
  description = "CIDR for Public subnet zone B"
  type        = string
  default     = "10.0.16.0/20"
}

#PRIVATE SUBNET CIDR
variable "skillup_private_subnet_a_cidr" {
  description = "CIDR for Private subnet zone A"
  type        = string
  default     = "10.0.128.0/20"
}

variable "skillup_private_subnet_b_cidr" {
  description = "CIDR for Private subnet zone B"
  type        = string
  default     = "10.0.144.0/20"
}

#PUBLIC SUBNET ZONE A
variable "public_subnet_a" {
  type        = map
  description = "Subnet Name"
  default     = {
    Name        = "skillup-public-subnet-a-m.balilo-001"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

#PUBLIC SUBNET ZONE B
variable "public_subnet_b" {
  type        = map
  description = "Subnet Name"
  default     = {
    Name        = "skillup-public-subnet-b-m.balilo-002"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

#PRIVATE SUBNET ZONE A
variable "private_subnet_a" {
  type        = map
  description = "Subnet Name"
  default     = {
    Name        = "skillup-private-subnet-a-m.balilo-001"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

#PRIVATE SUBNET ZONE B
variable "private_subnet_b" {
  type        = map
  description = "Subnet Name"
  default     = {
    Name        = "skillup-private-subnet-b-m.balilo-002"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

#INTERNET GATEWAY
variable "internet_gateway_tags" {
  type        = map
  description = "Internet Gateway"
  default     = {
    Name        = "skillup-igw-m.balilo-001"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

#ELASTIC IP FOR NAT GATEWAY
variable "elastic_ip_nat" {
  type        = map
  description = "Internet Gateway"
  default     = {
    Name        = "skillup-eip-m.balilo-001"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

#PUBLIC ROUTE TABLE
variable "public_route_table" {
  type        = map
  description = "Public Route Table"
  default     = {
    Name        = "skillup-public-rt-m.balilo-001"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

#PRIVATE ROUTE TABLE
variable "private_route_table" {
  type        = map
  description = "Private Route Table"
  default     = {
    Name        = "skillup-private-rt-m.balilo-001"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

#NAT GATEWAY TAGS
variable "nat_tags" {
  type        = map
  description = "NAT Gateway Tags"
  default     = {
    Name        = "skillup-nat-m.balilo-001"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

