output "public_dns" {
    value = aws_instance.server1.*.public_dns
}

output "public_dns2" {
    value = aws_instance.server2.*.public_dns
}