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