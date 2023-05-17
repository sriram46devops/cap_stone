#!/bin/bash
#
#Creating Docker Image
yum update -y
yum install docker
systemctl start docker
touch Dockerfile .

# Specify the file path
file_path="/home/ec2-user/Dockerfile"

# Data to be written to the file
special_chars='FROM ubuntu
RUN apt update
RUN apt install -y nginx
CMD ["nginx", "-g", "daemon off;"]'

# Write the data to the file
echo "$special_chars" > "$file_path"

#Build Docker image
docker build -t cap_prod:V2 .