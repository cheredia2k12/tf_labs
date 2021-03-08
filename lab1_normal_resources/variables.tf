variable "ami_id" {
    description = "AMI id para usar como imagen en la instancia"
    type = string
    #default = "ami-0915bcb5fa77e4892"
}

variable "region" {
    description = "Region a utilizar en aws"
    #type = string
    #default = "us-east-1"
}

variable "vpc_cidr" {
    description = "espacio de direcciones de nuestra VPC"
    #type = string
    #default = "192.168.0.0/16"
}

variable "subnet1_cidr" {
    description = "espacio de direcciones de nuestra Subnet"
    #type = string
    #default = "192.168.1.0/24"
}

variable "subnet1_zone_1a" {
    description = "zona de nuestra Subnet"
    #type = string
    #default = "us-east-1a"
}

variable "tipo_instancia" {
    description = "Tipo/size de instancia"
    #type = string
    #default = "t2.micro"
}

variable "subnet1_private_ip" {
    description = "Lista de ip privada a asignar como indice"
    #type = string
    default = ["192.168.1.10", "192.168.1.20", "192.168.1.30"]
}

#test