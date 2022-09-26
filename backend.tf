terraform {
backend "s3" {
bucket = "provigil1"
key = "main/terraform.tfstate"
region = "us-east-1"
dynamodb_table = "dynamodb"
}
}

