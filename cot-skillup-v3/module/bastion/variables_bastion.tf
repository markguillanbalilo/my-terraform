variable "ec2_instance_profile" {
  description = "ssm role for ec2"
  type        = string
  default     = "ec2-ssm"
}

#BASTION SG TAGS
variable "bastion_sg_tags" {
  type        = map
  description = "EC2 Name"
  default     = {
    Name        = "bastion-m.balilo-001"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

#BASTION EC2 TAGS
variable "bastion_ec2_tags" {
  type        = map
  description = "BASTION TAGS"
  default     = {
    Name        = "skillup-ec2-bastion-m.balilo-001"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
    Owner       = "m.balilo"
    Project     = "COT-CNF"
    Team        = "SRE1"
  }
}

#AUTO SCALING GROUP TAGS
variable "asg_sg_tags" {
  type        = map
  description = "Application Load Balancer Tags"
  default     = {
    Name        = "skillup-asg-sg-m.balilo-003"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

variable "ec2_instance_name" {
  description = "Name for web server EC2 instance"
  type        = string
  default     = "web_server"
}
 
variable "ec2_instance_type" {
  description = "Instance type for web server EC2 instance"
  type        = string
  default     = "t2.micro"
}
 

variable "vpc_id" {
  description = "VPC id for web server EC2 instance"
  type        = string
}
 
variable "public_subnet_1a_id" {
  description = "Subnet id for web server EC2 instance"
  type        = string
}

variable "ec2_security_group_name" {
  description = "Security group name for bastion server EC2 instance"
  type        = string
  default     = "skillup-bastion_sg-m.balilo-001"
 
}

variable "ec2_security_group_description" {
  description = "Security group description for web server EC2 instance"
  type        = string
  default     = "Allow traffic for bastion"
}

variable "bastion_key_name" {
  description = "Bastion keypair name"
  type        = string
  default     = "skillup-keypair_bastion-m.balilo-001"
}

variable "bastion_public_key" {
  description = "Public key generated from Putty"
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA2r0YjpLEfMuNdSlL1L/4AaHSwY3tdJtbJwZpnSyxV0vZ+vK3IsWr2M4TMmDqA2xCii7iLDZC6REinM5hZi+wfxXLIhCGqLotu+EWZWANyTPDdQKqlAEUOA9BKk8pMX9/XTvaePLYKbphTenvmoIVIDa1t6byH09XoK02dalUv1WZNoQc+CL+ObN0FoZiOMvpMeUlP0c2eOX9Eo2tOFTibIKfZhDdy+hQhsweyLJublLTLpsaqYn8iIpW19lesCDu0lw5Klc/J035TbHzwutCrjIgtiCMt2IUdXcpILsMhLlF7HyycxYYd73nb9CVAZ1x65EtkNPVVZQN4n18LUUMBw== rsa-key-20230622" 
}