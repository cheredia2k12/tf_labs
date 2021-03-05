resource "aws_security_group" "route_allow_http_ssh" {
    name = "route53_allow_ping_ssh_apache"
    vpc_id = "${aws_vpc.main1.id}"

    ingress  {
      cidr_blocks = ["0.0.0.0/0"]
      from_port = 80
      protocol = "tcp"
      to_port = 80
    }

    ingress  {
      cidr_blocks = ["0.0.0.0/0"]
      protocol = "tcp"
      from_port = 22
      to_port = 22
    } 

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


resource "aws_security_group" "elb_http" {
  name        = "allow_elb_http"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.main1.id

  ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_elb"
  }
}