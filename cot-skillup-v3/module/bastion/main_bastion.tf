/*#SECURITY GROUP FOR BASTION
resource "aws_security_group" "bastion_sg" {
  name        = "skillup-bastion-sg-m.balilo-002"
  description = "Security Group for Bastion Host"
  vpc_id  = aws_vpc.skillup_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.bastion_sg_tags
}*/

#GET THE PUBLIC IP OF MY PC
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

#CREATE KEY PAIR
resource "aws_key_pair" "bastion_keypair" {
  key_name = var.bastion_key_name
  public_key = var.bastion_public_key
}


data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}


resource "aws_security_group" "bastion_sg" {
  name        = var.ec2_security_group_name
  description = var.ec2_security_group_description
  vpc_id      = var.vpc_id
 
  ingress {
    description      = "Allow traffic on port 22 from everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${chomp(data.http.myip.response_body)}/32"]
  }
 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 
  tags =  var.bastion_sg_tags
}


#Provision Bastion Host 
resource "aws_instance" "bastion_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.ec2_instance_type
  iam_instance_profile = var.ec2_instance_profile
 
  subnet_id              = var.public_subnet_1a_id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name = aws_key_pair.bastion_keypair.key_name
 
  tags = var.bastion_ec2_tags
  
  user_data = filebase64("${path.module}/bastion_script.sh")
/*
  user_data = <<-EOF
   #!/bin/bash
   sudo su ec2-user
   echo '-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEA2r0YjpLEfMuNdSlL1L/4AaHSwY3tdJtbJwZpnSyxV0vZ+vK3
IsWr2M4TMmDqA2xCii7iLDZC6REinM5hZi+wfxXLIhCGqLotu+EWZWANyTPDdQKq
lAEUOA9BKk8pMX9/XTvaePLYKbphTenvmoIVIDa1t6byH09XoK02dalUv1WZNoQc
+CL+ObN0FoZiOMvpMeUlP0c2eOX9Eo2tOFTibIKfZhDdy+hQhsweyLJublLTLpsa
qYn8iIpW19lesCDu0lw5Klc/J035TbHzwutCrjIgtiCMt2IUdXcpILsMhLlF7Hyy
cxYYd73nb9CVAZ1x65EtkNPVVZQN4n18LUUMBwIBJQKCAQA1NOpMMYm9fZ7y/DUK
PIhvGYZKwah2T02GCHqOA/PJIEnHa3inl92xRuITLFSZDH7jV4MfgtIBVzHuymq3
/cMl1N5iO18GcnnTwSEfk+ete0s4Iz4/rTxE/MqpbTOIlKJwn9syLTt/xY1KTaj8
Ec3JkMRq8UHQQ7teb1JvpbqrFF8WJAuMyDUSoiWwdKsckhDJ1ck/IoClPhRBUBQR
06YAEehnLRmZ/p8fqc/tI58Gj4/Mf1Si4UxlM86jqQiomyJNL0LVPRZHGeLS9IFg
O+NyEFQYGIuL96Sur6C9Vwg4dAusfgCb36TKbJONE0eTvpoVVIXDd1vheLA3k6S/
lU49AoGBAPJwUyAemHvXXP7xVy1S4R67EYiS1/qojb2SzgKG2R0Lq3KFLBb9DXFR
QBLdd9BB0WPcwKNKHmmGSTLSFuXU6dkiEjatxh+iM8DJBPpAGq6/y1f7qLghDeSp
TN3aQH9iGXgF93WQ2MOmf7IrOExHAyB4IWkZivHvRKaauc3BYgZZAoGBAOb5Y+nP
qMSj9L3BiHVwddrHSEThxPIMkew6WgLZ+TdgjY3jZEEc4InsQ7UcUteDT65eeaml
W5HT+mC6RHG0R4ir3QwsXRlEWneTMZBMhQlSXItz2gisPac25n2RahYBpkiTKeUM
F69YKoFV87CwiruNhhBTs4YctJLVD150thlfAoGBAN7IFQjCK0FeHhq0QkVTFA5m
tip5GX6NDKBdY1xEkCiHQ5mqzpGqQ7Q80xhBIf2kQ985jmyJTGD38DyJtC0kg9xI
0ndvQHAYgpV6c0bTH3Al3XNxofVOzn8YHR7kO0SfVayP3HnfDGDCgy4Z4LTLogIp
M3VVvfMTOCpkqr0SkW2dAoGAErpGXxDWVSIM7MqAr5N/LWoanc0dzm+4zfbktB+C
6NB6LhlbJ9+/LccMaKFugC09z94likuteobPHJl7K9BY07roaMVTqBpMhjxd9vFy
kg2YzQlktJhYBqOWJdtboOtggmzMC6cI1t2ilN10n5+ci79d5aXr9h4AzaKSix44
Rz8CgYEAhdy0M4VbaJ226Vv/2fewLraS6fWvzj5sij14pl0rEBRlUAZjs6MZM+Wd
Obzcb7D/dwFvVfDiPzLPEZrWm0hLSp+GfHS3JzKfsTrHF2aqQUqqMNPbZxoLK1aZ
zWV21mDqabak+4oRt6z/aMfVP0BI6cCFQ+FjCasfQij3y9fJMB8=
-----END RSA PRIVATE KEY-----' > /home/ec2-user/webserver.pem
   EOF
*/
}


