variable "public_subnet_1a_id" {
  description = "Subnet id for web server EC2 instance"
  type        = string
}

variable "public_subnet_1b_id" {
  description = "Subnet id for web server EC2 instance"
  type        = string
}

variable "alb_vpc_id" {
  description = "VPC id for web server EC2 instance"
  type        = string
}

#APPLICATION LOAD BALANCER TAGS
variable "alb_sg_tags" {
  type        = map
  description = "Application Load Balancer Tags"
  default     = {
    Name        = "skillup-alb-sg-m.balilo-002"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}