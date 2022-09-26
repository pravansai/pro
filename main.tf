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
}
resource "aws_eip" "ec2" {
vpc = true
instance = aws_instance.ec2.id
}
