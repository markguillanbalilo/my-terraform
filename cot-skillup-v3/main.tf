terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.6.2"
    }
  }
}
provider "aws" {
  shared_config_files      = ["C:/Users/mark/.aws/config"]
  shared_credentials_files = ["C:/Users/mark/.aws/credentials"]
  profile                  = "terraform"
  region                   = "ap-southeast-2"

}

module "skillup_vpc" {
  source = "C:/Users/mark/Documents/Terraform/cot-skillup-v3/module/vpc"
}

module "skillup_bastion" {
  source              = "C:/Users/mark/Documents/Terraform/cot-skillup-v3/module/bastion"
  ec2_instance_type   = var.ec2_instance_type
  vpc_id              = module.skillup_vpc.vpc_id
  public_subnet_1a_id = module.skillup_vpc.public_subnet_1a_id
}

module "skillup_alb" {
  source = "C:/Users/mark/Documents/Terraform/cot-skillup-v3/module/applb"
  alb_vpc_id              = module.skillup_vpc.vpc_id
  public_subnet_1a_id = module.skillup_vpc.public_subnet_1a_id
  public_subnet_1b_id = module.skillup_vpc.public_subnet_1b_id
}

module "skillup_asg" {
  source = "C:/Users/mark/Documents/Terraform/cot-skillup-v3/module/autoscaling_group"
  asg_vpc_id = module.skillup_vpc.vpc_id
  bastion_sg_id = module.skillup_bastion.bastion_sg_id
  alb_sg_id = module.skillup_alb.alb_sg_id
  private_subnet_1a_id = module.skillup_vpc.private_subnet_1a_id
  private_subnet_1b_id = module.skillup_vpc.private_subnet_1b_id
  target_group_arn = module.skillup_alb.target_group_arn
}