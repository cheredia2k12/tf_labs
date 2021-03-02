provider "aws" {
    region = "us-east-1"
#    access_key = "xxxxxxx"
#    secret_key = "xxxxxxx"
}

resource "aws_instance" "test" {
    ami = "ami-0915bcb5fa77e4892"
    instance_type = "t2.micro"
}



