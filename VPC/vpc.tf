resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"

 tags ={
  Name = "terraformdon"
 }
}

resource "aws_subnet" "public_subnet" {
 vpc_id = aws_vpc.main.id
 cidr_block = "10.0.1.0/24"

 availability_zone = "ap-northeast-2a"

 tags = {
  Name = "terraformdon-public-subnet"
 }
}

resource "aws_subnet" "private_subnet" {
 vpc_id = aws_vpc.main.id
 cidr_block = "10.0.2.0/24"

 availability_zone = "ap-northeast-2a"

 tags = {
  Name = "terraformdon-private-subnet"
 }
}

resource "aws_internet_gateway" "igw" {
 vpc_id = aws_vpc.main.id

 tags = {
  Name = "terraformdon-private-subnet"
 }
}

resource "aws_eip" "nat" {
 vpc = true

 lifecycle {
  create_before_destroy = true
 }
}

resource "aws_nat_gateway" "nat_gateway" {
 allocation_id = aws_eip.nat.id

 subnet_id = aws_subnet.public_subnet.id

 tags = {
  Name = "terraformdon_NATGW"
 }
}
