resource "aws_elb" "my_elb" {
  name               = "my-terraform-elb"
  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnets = [ "${aws_subnet.subnet1.id}", "${aws_subnet.subnet2.id}", "${aws_subnet.subnet3.id}",]
  security_groups = [ aws_security_group.elb_http.id ]
  #access_logs {
  #  bucket        = "foo"
  #  bucket_prefix = "bar"
  #  interval      = 60
  #}

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  #listener {
  #  instance_port      = 8000
  #  instance_protocol  = "http"
  #  lb_port            = 443
  #  lb_protocol        = "https"
  #  ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  #}

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 10
  }

  instances                   = [aws_instance.server1.id, aws_instance.server2.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "my-terraform-elb"
  }
}