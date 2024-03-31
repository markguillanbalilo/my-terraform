output "target_group_arn" {
  description = "ID of EC2 instance"
  value       = aws_lb_target_group.skillup_web_tg.arn
}

output "alb_sg_id" {
  description = "ID of EC2 instance"
  value       = aws_security_group.alb_sg.id
}


