#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl start nginx
sudo systemctl enable nginx 
sudo echo "Hello world from $(hostname -f)" | sudo tee /usr/share/nginx/html/index.html
