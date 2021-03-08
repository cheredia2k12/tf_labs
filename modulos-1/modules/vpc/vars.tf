variable "vpc_cidr" {
    description = "espacio de direcciones de nuestra VPC"
    #type = string
    default = "10.0.0.0/16"
}

variable "tenancy" {
  default = "dedicated"
}

variable "subnet_cidr" {
    description = "espacio de direcciones de nuestra Subnet"
    #type = string
    default = "10.0.1.0/24"
}

variable "vpc_id" {}

