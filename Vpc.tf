resource "aws_vpc" "lab_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc_name
  }
}
resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_public_a
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch =true
  tags = {
    Name = "Public_Subnet_a"
  }
}
resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_public_b
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch =true
  tags = {
    Name = "Public_Subnet_b"
  }
}
resource "aws_subnet" "public_c" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_public_c
  availability_zone = "eu-west-1c"
  map_public_ip_on_launch =true
  tags = {
    Name = "Public_Subnet_c"
  }
}
resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_private_a
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Private_Subnet_a"
  }
}
resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_private_b
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Private_Subnet_b"
  }
}
resource "aws_subnet" "private_c" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_private_c
  availability_zone = "eu-west-1c"

  tags = {
    Name = "Private_Subnet_c"
  }
}
resource "aws_subnet" "data" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_data
  availability_zone = "eu-west-1c"

  tags = {
    Name = "Data_Subnet"
  }
}
resource "aws_internet_gateway" "Internet_Gateway" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name = "Internet_Gateway"
  }
}
resource "aws_eip" "Nat_eip" {
  vpc      = true
}
  
resource "aws_nat_gateway" "NAT_Gw" {
  allocation_id = aws_eip.Nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "NAT_Gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.Internet_Gateway]
}