provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "diandy49999" # Replace with your unique bucket name
  acl    = "private" # Adjust the ACL as needed (e.g., "public-read")

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
  }
}


