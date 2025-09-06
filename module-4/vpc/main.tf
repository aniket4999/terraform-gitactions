resource "aws_vpc" "my-vpc01" {
    cidr_block = var.cidr_block
      tags = {
        Name = "my-vpc"

      }  
}

resource "aws_subnet" "my-sub-01" {
    vpc_id = aws_vpc.my-vpc01.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
      Name="tf-pub-subnet-01"
    }
  
}

resource "aws_internet_gateway" "my-igw" {
      vpc_id = aws_vpc.my-vpc01.id
      tags = {
        Name = "tf-igw"
      }
    }
