#GET THE PUBLIC IP OF MY PC
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

#SECURITY GROUP FOR APPLICATION LOAD BALANCER
resource "aws_security_group" "alb_sg" {
  name        = "skillup-alb-sg-m.balilo-002"
  description = "Security Group for Application Load Balancer"
  vpc_id      = var.alb_vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.alb_sg_tags
}

#APPLICATION LOAD BALANCER
resource "aws_lb" "skillup_alb" {
  name               = "skillup-alb-mbalilo-001"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [var.public_subnet_1a_id, var.public_subnet_1b_id]


  tags = {
    Environment = "production"
  }
}

#TARGET GROUP FOR APPLICATION LOAD BALANCER
resource "aws_lb_target_group" "skillup_web_tg" {
  name     = "skillup-tg-asg-mbalilo-001"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.alb_vpc_id
}

#LISTENER
resource "aws_lb_listener" "skillup_listener" {
  load_balancer_arn = aws_lb.skillup_alb.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.skillup_web_tg.arn
  }
}