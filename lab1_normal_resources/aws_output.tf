output "public_dns" {
  value = aws_instance.servers.*.public_dns
}
