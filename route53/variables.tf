variable "region" {
  default = "us-east-2"
}   

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "subnet1_cidr" {
  type = "list"
  default = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}

variable "azs_list" {
  type = "list"
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

data "aws_availability_zones" "azs" {}

variable "tipo_instancia" {
    description = "Tipo/size de instancia"
    #type = string
    default = "t2.micro"
}
/*
variable "ami_id" {
    description = "AMI id para usar como imagen en la instancia"
    type = string
    default = "ami-09246ddb00c7c4fef"
}
*/
variable "ec2_ami" {
  type = "map"
  default = {
    us-east-1 = "ami-0915bcb5fa77e4892"
    us-east-2 = "ami-09246ddb00c7c4fef"
  }
}