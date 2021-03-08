resource "aws_key_pair" "key-class1" {
    key_name = "class_key1"
    public_key = "${file("class_key.pem.pub")}"
}

resource "aws_instance" "server1" {
    #ami = "${var.ami_id}"
    #utilizo funcion lookup (tipo de variable mapa)
    ami = "${lookup(var.ec2_ami, var.region)}"
    instance_type = "${var.tipo_instancia}"
    subnet_id = "${aws_subnet.subnet1.id}"
    associate_public_ip_address = true
    private_ip = "192.168.10.100"
    vpc_security_group_ids = ["${aws_security_group.route_allow_http_ssh.id}"]
    key_name = "${aws_key_pair.key-class1.id}"
    depends_on = [ aws_internet_gateway.gw ]
    user_data = "${file("userdata2.sh")}"
 
    tags = {
      "Name" = "server1"
      "Owner" = "terraform"
      "Env" = "dev"
    }
}

resource "aws_instance" "server2" {
    #ami = "${var.ami_id}"
    #utilizo funcion lookup (tipo de variable mapa)
    ami = "${lookup(var.ec2_ami, var.region)}"    
    instance_type = "${var.tipo_instancia}"
    subnet_id = "${aws_subnet.subnet1.id}"
    associate_public_ip_address = true
    private_ip = "192.168.10.200"
    vpc_security_group_ids = ["${aws_security_group.route_allow_http_ssh.id}"]
    key_name = "${aws_key_pair.key-class1.id}"
    depends_on = [ aws_internet_gateway.gw ]
    user_data = "${file("userdata2.sh")}"
 
    tags = {
      "Name" = "server2"
      "Owner" = "terraform"
      "Env" = "dev"
    }
}