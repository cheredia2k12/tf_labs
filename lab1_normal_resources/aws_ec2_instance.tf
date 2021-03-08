resource "aws_instance" "servers" {
  ami           = var.ami_id
  instance_type = var.tipo_instancia
  #para no harcorear la cantidad de instancias, uso length para que cree todas las instancias 
  #en funcion a la cantidad de ip privadas que defino
  #count = 3
  count                       = length(var.subnet1_private_ip)
  subnet_id                   = aws_subnet.main1.id
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.sg1.id}", "${aws_security_group.sg2.id}"]
  key_name                    = aws_key_pair.key-class1.id
  user_data                   = file("userdata.sh")
  #en caso de querer establecer ip fija, usamos el siguiente index
  private_ip = element(var.subnet1_private_ip, count.index)

  tags = {
    "Name"  = "server-${count.index + 1}"
    "Owner" = "terraform"
    "Env"   = "dev"
  }
}

