provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec201" {
    ami = var.amivalue
    instance_type = var.instance_type
    
    tags = {
    Name        = "test"
  }
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "your-unique-bucket-name" # Replace with your unique bucket name
  acl    = "private" # Adjust the ACL as needed (e.g., "public-read")

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket         = [aws_s3_bucket.example_bucket.name] # Replace with your S3 bucket name
    key            = "/" # Path within the bucket for the state file
    region         = "us-east-1"                 # AWS region of your S3 bucket
    encrypt        = true                        # Encrypt the state file at rest
#    dynamodb_table = "your-lock-table"           # DynamoDB table for state locking (optional but recommended)
    depends_on = [
    aws_s3_bucket.example_bucket
  ]
#
  }
}

