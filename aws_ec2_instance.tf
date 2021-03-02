resource "aws_instance" "server1" {
    ami = "ami-0915bcb5fa77e4892"
    instance_type = "t2.micro"
    count = 1
    subnet_id = "${aws_subnet.main1.id}"
    associate_public_ip_address = true
    vpc_security_group_ids = ["${aws_security_group.sg1.id}", "${aws_security_group.sg2.id}"]



    tags = {
      "Name" = "server1"
      "Owner" = "terraform"
      "Env" = "dev"
    }
}