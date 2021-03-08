output "public_dns" {
  value = aws_instance.server1.*.public_dns
}

output "public_dns2" {
  value = aws_instance.server2.*.public_dns
}

output "public_dns_elb" {
  value = aws_elb.my_elb.dns_name
}

output "server1_ip" {
  value = aws_instance.server1.private_ip
}

output "server1_eip" {
  value = aws_eip.default.public_ip
}

output "server2_ip" {
  value = aws_instance.server2.private_ip
}

output "server2_eip" {
  value = aws_eip.default2.public_ip
}
