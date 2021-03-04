resource "aws_instance" "server1" {
    ami = "${var.ami_id}"
    instance_type = "${var.tipo_instancia}"
    count = 1
    subnet_id = "${aws_subnet.main1.id}"
    associate_public_ip_address = true
    vpc_security_group_ids = ["${aws_security_group.sg1.id}", "${aws_security_group.sg2.id}"]
    key_name = "${aws_key_pair.key-class1.id}"
    user_data = "${file("userdata.sh")}"

    tags = {
      "Name" = "server1"
      "Owner" = "terraform"
      "Env" = "dev"
    }
}

output "public_dns" {
    value = aws_instance.server1.*.public_dns
  
}