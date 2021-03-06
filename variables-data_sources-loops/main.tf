provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "main1" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    "Name" = "Main1"
  }
}

##creo 3 subnet definidas en variables, cada subnet se crea en una diferente AZ, obtenida como data source
resource "aws_subnet" "subnets" {
  #count = "${length(var.azs_list)}"
  #availability_zone = "{element(var.azs_list, count.index)}"
  count = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  vpc_id = "${aws_vpc.main1.id}"
  cidr_block = "${element(var.subnet1_cidr, count.index)}"
 
 #se crea cada subnet con nombre correlativo desde 1 en adelante de forma autom.
  tags = {
    "Name" = "Subnet-${count.index +1}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main1.id}"

  tags = {
    "Name" = "VPC Main"
  }
}

resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.main1.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    "Name" = "Public Subnet RT"
  }
}

resource "aws_route_table_association" "public-subnet" {
  count = "${length(var.subnet1_cidr)}"
  subnet_id = "${element(aws_subnet.subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}