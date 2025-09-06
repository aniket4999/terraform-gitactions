provider "aws" {
    region = "us-east-1"
  
}

module "vpc" {
    source = "./vpc"
    cidr_block = "10.0.0.0/16"
  
}

module "sg" {
    source = "./sg"
    vpc_id = module.vpc.my_vpc
  
}

module "ec2" {
    source = "./ec2"
  
}


resource "aws_s3_bucket" "example_bucket" {
  bucket = "diandy4999-01" # Replace with your unique bucket name
  acl    = "private" # Adjust the ACL as needed (e.g., "public-read")

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
  }
}
/*
terraform {
  backend "s3" {
#    bucket         = [aws_s3_bucket.example_bucket.name] # Replace with your S3 bucket name
    bucket         = "di-love01"
    key            = "tfstatefiles/terraform.tfstate" # Path within the bucket for the state file
    region         = "us-east-1"                 # AWS region of your S3 bucket
    encrypt        = true                        # Encrypt the state file at rest
#    dynamodb_table = "your-lock-table"           # DynamoDB table for state locking (optional but recommended)
#    depends_on = [
#    aws_s3_bucket.example_bucket
#  ]
#