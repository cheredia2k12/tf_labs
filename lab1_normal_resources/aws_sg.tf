resource "aws_security_group" "sg1" {
  name        = "ssh icmp"
  vpc_id      = aws_vpc.main1.id
  description = "permitir ssh ping"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "permitir ssh"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "permitir ping"
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "SSH ICMP"
  }
}

resource "aws_security_group" "sg2" {
  name        = "sg_http_https"
  vpc_id      = aws_vpc.main1.id
  description = "permitir http-https"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "permitir http"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "permitir https"
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  }

  tags = {
    "Name" = "HTTP/HTTPS"
  }
}
