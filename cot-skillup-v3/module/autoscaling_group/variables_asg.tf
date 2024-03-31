variable "launch_name" {
  description = "Name Tag"
  type        = string
  default     = "skillup-lt-m.balilo-001"
}

variable "instance_type" {
  description = "Instance type of web server"
  type        = string
  default     = "t3a.micro"
}

variable "asg_vpc_id" {
  description = "vpc id to be associateed with asg"
  type        = string
}

variable "bastion_sg_id" {
  description = "vpc id to be associateed with asg"
  type        = string
}

variable "alb_sg_id" {
  description = "alb sg id"
  type        = string
}


variable "asg_sg_tags" {
  type        = map
  description = "asg sg tags"
  default     = {
    Name        = "skillup-asg-sg-m.balilo-003"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}


variable "asg_ec2_tags" {
  type        = map
  description = "asg ec2 tags"
  default     = {
    Name        = "skillup-asg-ec2-m.balilo-002"
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
    Owner       = "m.balilo"
    Project     = "COT-CNF"
    Team        = "SRE1"
  }
}


variable "asg_key_name" {
  description = "Bastion keypair name"
  type        = string
  default     = "skillup-keypair_bastion-m.balilo-001"
}

variable "asg_public_key" {
  description = "Public key generated from Putty"
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA2r0YjpLEfMuNdSlL1L/4AaHSwY3tdJtbJwZpnSyxV0vZ+vK3IsWr2M4TMmDqA2xCii7iLDZC6REinM5hZi+wfxXLIhCGqLotu+EWZWANyTPDdQKqlAEUOA9BKk8pMX9/XTvaePLYKbphTenvmoIVIDa1t6byH09XoK02dalUv1WZNoQc+CL+ObN0FoZiOMvpMeUlP0c2eOX9Eo2tOFTibIKfZhDdy+hQhsweyLJublLTLpsaqYn8iIpW19lesCDu0lw5Klc/J035TbHzwutCrjIgtiCMt2IUdXcpILsMhLlF7HyycxYYd73nb9CVAZ1x65EtkNPVVZQN4n18LUUMBw== rsa-key-20230622" 
}


variable "iam_instance_profile_name" {
  description = "Provided by skillup"
  type        = string
  default     = "ec2-ssm"
}

variable "asg_name" {
  description = "Name of asg"
  type        = string
  default     = "skillup-asg-mbalilo-001"
}


variable "private_subnet_1a_id" {
  description = "Subnet id for web server EC2 instance"
  type        = string
}

variable "private_subnet_1b_id" {
  description = "Subnet id for web server EC2 instance"
  type        = string
}

variable "target_group_arn" {
  description = "Subnet id for web server EC2 instance"
  type        = string
}



variable "image_id" {
  description = "Image ID for Ubuntu 20.04"
  type        = string
  default     = "ami-0d02292614a3b0df1"
}