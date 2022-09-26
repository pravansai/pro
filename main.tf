provider "aws" {
profile = "default"
region = "us-east-1"
}
resource "aws_instance" "ec2" {
ami = "ami-026b57f3c383c2eec"
instance_type = "t2.micro"
key_name = "pro"
tags = {
name = "mymachine"
}
ingress {
from_port = 8080
to_port = 8080
protocol = "tcp"
cidr_block = ["0.0.0.0/0"]
}
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_block = ["0.0.0.0/0"]
}
egress {
from_port = 0
to_port = 65535
protocol = "tcp"
cidr_block = ["0.0.0.0/0"]
}
resource "aws_eip" "ec2" {
vpc = true
instance = aws_instance.ec2.id
}
