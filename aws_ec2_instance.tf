resource "aws_instance" "server1" {
    ami = "ami-0915bcb5fa77e4892"
    instance_type = "t2.micro"
    count = 1
    subnet_id = "${aws_subnet.main1.id}"
}