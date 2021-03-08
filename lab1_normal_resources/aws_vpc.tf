resource "aws_vpc" "main1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Main VPC 1"
  }
}

resource "aws_subnet" "main1" {
  vpc_id                  = aws_vpc.main1.id
  cidr_block              = var.subnet1_cidr
  availability_zone       = var.subnet1_zone_1a
  map_public_ip_on_launch = true

  tags = {
    "Name" = "Main Subnet 1"
  }
}

resource "aws_internet_gateway" "gwmain1" {
  vpc_id = aws_vpc.main1.id

  tags = {
    Name = "gw main1"
  }
}

resource "aws_route_table" "rtmain1" {
  vpc_id = aws_vpc.main1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gwmain1.id
  }

  tags = {
    "Name" = "Route Table Main1"
  }
}

resource "aws_route_table_association" "table_subnet1" {
  subnet_id      = aws_subnet.main1.id
  route_table_id = aws_route_table.rtmain1.id
}
