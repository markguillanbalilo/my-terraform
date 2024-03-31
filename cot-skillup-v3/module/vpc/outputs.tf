output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.skillup_vpc.id
}
 
output "public_subnet_1a_id" {
  description = "ID of the VPC subnet"
  value       = aws_subnet.skillup_public_subnet_1za.id
}

output "public_subnet_1b_id" {
  description = "ID of the VPC subnet"
  value       = aws_subnet.skillup_public_subnet_1zb.id
}

output "private_subnet_1a_id" {
  description = "ID of the VPC subnet"
  value       = aws_subnet.skillup_private_subnet_1za.id
}

output "private_subnet_1b_id" {
  description = "ID of the VPC subnet"
  value       = aws_subnet.skillup_private_subnet_1zb.id
}