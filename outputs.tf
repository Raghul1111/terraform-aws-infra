
output "instance_id" {
  description = "EC2 Instance ID"

  value = aws_instance.web_server.id
}

output "public_ip" {
  description = "EC2 Public IP"

  value = aws_instance.web_server.public_ip
}

output "private_ip" {
  description = "EC2 Private IP"

  value = aws_instance.web_server.private_ip
}