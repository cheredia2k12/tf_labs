resource "aws_eip" "default" {
  instance = aws_instance.server1.id
  vpc      = true

  tags = {
    "Name" = "Server1 eip"
  }
}

resource "aws_eip" "default2" {
  instance = aws_instance.server2.id
  vpc      = true

  tags = {
    "Name" = "Server2 eip"
  }
}
