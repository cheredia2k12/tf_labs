resource "aws_key_pair" "key-class1" {
  key_name   = "class_key1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCggcbXfYiyKyYjZtfNCpNWWyfMXMMHqZnbSbCW+W6rA5LsDW/CPCWhyXxtRPWAmMZ1EEs/ZGvhPJMqNKJebxqBuUOr3HTAvppzLtntZycaj1TgXkVCvbTJe/UITKkLNVlbRrny8vtXtjtYhQ4utNrmuhm3rqbS0CzCj3fx9200GWVlM31uXMsjG7UxfXWYNoYA+tg6FYyY5pwvWgmENq6TV2s5GY9Lrth12abGnmyufkoqz7qA5ds7sMgA7Va8JkqG2g1qEYO2r2MJc1D1YQRRPWAwZio43XhWkxGbKXSQVQ6vqRYH80eD0QWGnwNQ9x2m+gxVvMNQlqqpjmOvQwZcS9aKu8Y8xHxeYvGdMfOC4QQJaKV8v1jbcu3qXxreky6JmaH36n8ytnPS2SJjs5oEW7LlZftcj++wGZz3GNaJYWOxpTdq0HY8onYHpPAiRlzqDoWclje33tF54ey7Ww+TiZoMgFYAJkKJ3oEtGMNF7Bat+WmjCA0UZTsNKuVXphodyxYR1LUntiIHVxyXB8IjfzMu/nIc3RSTYMSpriLXC6/8dVMit5OdG8Ev26BYq8lgEOIPjYkIthSeyOp6vpkgCFyLt2BefE/i0g015DXK0s8vTHPHdImCnaxM21EOeeChCIHJ/FiGtejqb92cnx9WBie1I926/oJnoHJXBAI/2w=="
}

resource "aws_key_pair" "key-class2" {
  key_name   = "class_key2"
  public_key = file("class_key.pem.pub")
}
