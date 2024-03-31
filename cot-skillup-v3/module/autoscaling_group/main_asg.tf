#SECURITY GROUP FOR AUTO SCALING GROUP
resource "aws_security_group" "asg_sg" {
  name        = "skillup-asg-sg-m.balilo-003"
  description = "Security Group for Bastion Host"
  vpc_id  = var.asg_vpc_id

  ingress {
    from_port   = 6522
    to_port     = 6522
    protocol    = "tcp"
    security_groups = [var.bastion_sg_id]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [var.alb_sg_id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.asg_sg_tags
}

# Launch Template Resource
resource "aws_launch_template" "skillup_launchtemplate" {
  name = var.launch_name
  description = "My Launch Template"
  image_id = var.image_id
  #image_id = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.asg_sg.id]
  key_name = var.asg_key_name 
  #user_data = filebase64("${path.module}/app1-install.sh")
  #ebs_optimized = true
  #default_version = 1
  update_default_version = true
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 8 
      #volume_size = 20 # LT Update Testing - Version 2 of LT      
      delete_on_termination = true
      volume_type = "gp3" # default is gp2
     }
  }
  iam_instance_profile {
    name = var.iam_instance_profile_name
  }
  user_data = filebase64("${path.module}/asg-user-data.sh")

  tag_specifications {
    resource_type = "instance"
    tags = var.asg_ec2_tags
  }
}

resource "aws_autoscaling_group" "skillup_asg" {
  name = var.asg_name
  desired_capacity = 1
  max_size = 1
  min_size = 1
  health_check_type         = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier = [var.private_subnet_1a_id, var.private_subnet_1b_id]
  target_group_arns = [var.target_group_arn]
  launch_template {
    id = aws_launch_template.skillup_launchtemplate.id
    version = "$Latest"
  }
  termination_policies = [ "OldestInstance" ]
}