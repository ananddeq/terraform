provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "project-vpc" {
  cidr_block = "10.0.0.0/22"
  tags = {
    Name = "project"
  }
}


resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.1.0/25"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-sub-1"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.0.0/25"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-sub-1"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.project-vpc.id
}

resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.project-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    "Name" = "public_RT"
  }
}

resource "aws_route_table_association" "public_01_RT_ass" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.public_RT.id
}

