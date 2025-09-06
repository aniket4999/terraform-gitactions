output "vpc_id" {
    value = aws_vpc.my-vpc01.id
  
}

output "subnet" {
    value = aws_subnet.my-sub-01.id
  
}

output "aws_internet_gateway" {
    value = aws_internet_gateway.my-igw.id
  
}