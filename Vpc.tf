resource "aws_vpc" "lab_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc_name
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_public

  tags = {
    Name = "Public_Subnet"
  }
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_private

  tags = {
    Name = "Private_Subnet"
  }
}
resource "aws_subnet" "data" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_data

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