output "vpc_id" {
  description = "ID of the vpc"
  value       = module.skillup_vpc.vpc_id
}

output "instance_id" {
  description = "ID of EC2 instance"
  value       = module.skillup_bastion.instance_id
}

output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = module.skillup_bastion.instance_public_ip
}