provider "aws" {
profile = "default"
region = "us-east-1"
}
resource "aws_instance" "ec2" {
ami = "ami-026b57f3c383c2eec"
instance_type = "t2.micro"
key_name = "pro"
}
resource "aws_ami_from_instance" "example" {
  name               = "terraform"
  source_instance_id = "$amicreation"
}


