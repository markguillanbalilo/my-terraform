#!/bin/bash
#Changing SSH port to 6522
sudo sed -i 's/^#Port 22/Port 6522/' /etc/ssh/sshd_config
sudo systemctl restart sshd

#Installing Apache2
sudo apt update
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

#Installing AWS CLI
sudo apt update
sudo apt install -y awscli

#Copy html file
aws s3 cp s3://mbbalilo-singapore-documents/index.html /var/www/html/index.html
#aws s3 cp s3://skillup-s3-bucket-mbalilo/aws-m.balilo.html /var/www/html/index.html