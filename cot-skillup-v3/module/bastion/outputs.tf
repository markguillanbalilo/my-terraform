output "instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.bastion_server.id
}
 
output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.bastion_server.id
}

output "bastion_sg_id" {
  description = "security group id of bastion"
  value       = aws_security_group.bastion_sg.id
}