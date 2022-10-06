resource "aws_route_table" "Int_route_tbl" {
  vpc_id = aws_vpc.lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Internet_Gateway.id
  }



  tags = {
    Name = "Internet_Route_Table"
  }
}

resource "aws_route_table" "nat_route_tbl" {
  vpc_id = aws_vpc.lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT_Gw.id
  }



  tags = {
    Name = "nat_Route_Table"
  }
}

resource "aws_route_table_association" "Public_Subnet_a_IGW" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.Int_route_tbl.id
}

resource "aws_route_table_association" "Public_Subnet_b_IGW" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.Int_route_tbl.id
}
resource "aws_route_table_association" "Public_Subnet_c_IGW" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.Int_route_tbl.id
}
resource "aws_route_table_association" "Private_Subnet_a_Nat" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.nat_route_tbl.id
}
resource "aws_route_table_association" "Private_Subnet_b_Nat" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.nat_route_tbl.id
}
resource "aws_route_table_association" "Private_Subnet_c_Nat" {
  subnet_id      = aws_subnet.private_c.id
  route_table_id = aws_route_table.nat_route_tbl.id
}
resource "aws_route_table_association" "Private_Subnet_d_Nat" {
  subnet_id      = aws_subnet.private_d.id
  route_table_id = aws_route_table.nat_route_tbl.id
}
resource "aws_route_table_association" "data" {
  subnet_id      = aws_subnet.data.id
  route_table_id = aws_route_table.nat_route_tbl.id
}