resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags       = merge(var.tagging, { Name = "DotNet-Project" })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tagging, { Name = "DotNet-IGW" })
}

resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tagging, { Name = "InternetRT" })
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.publicsubnet1.id
  tags          = merge(var.tagging, { Name = "DotNet-NAT" })
}

resource "aws_eip" "nat_eip" {
  domain   = "vpc"
  tags     = merge(var.tagging, { Name = "DotNet-NAT-EIP" })
}

resource "aws_route_table" "privatert" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tagging, { Name = "PrivateRT" })
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
}
}
resource "aws_route" "private_route1" {
  route_table_id         = aws_route_table.privatert.id
  destination_cidr_block = var.private_subnet1
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "private_route2" {
  route_table_id         = aws_route_table.privatert.id
  destination_cidr_block = var.private_subnet2
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "private_route3" {
  route_table_id         = aws_route_table.privatert.id
  destination_cidr_block = var.private_subnet3
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_subnet" "privatesubnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet1
  tags       = merge(var.tagging, { Name = "Private-Subnet1" })
}

resource "aws_subnet" "privatesubnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet2
  tags       = merge(var.tagging, { Name = "Private-Subnet2" })
}

resource "aws_subnet" "privatesubnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet3
  tags       = merge(var.tagging, { Name = "Private-Subnet3" })
}

resource "aws_subnet" "publicsubnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet1
  tags       = merge(var.tagging, { Name = "Public-Subnet1" })
}

resource "aws_route_table_association" "private_subnet1_assoc" {
  subnet_id      = aws_subnet.privatesubnet1.id
  route_table_id = aws_route_table.privatert.id
}

resource "aws_route_table_association" "private_subnet2_assoc" {
  subnet_id      = aws_subnet.privatesubnet2.id
  route_table_id = aws_route_table.privatert.id
}

resource "aws_route_table_association" "private_subnet3_assoc" {
  subnet_id      = aws_subnet.privatesubnet3.id
  route_table_id = aws_route_table.privatert.id
}

resource "aws_route_table_association" "public_subnet3_assoc" {
  subnet_id      = aws_subnet.publicsubnet1.id
  route_table_id = aws_route_table.publicrt.id
}
