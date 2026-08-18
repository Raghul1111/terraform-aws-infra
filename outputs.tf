
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

output "aws_security_group" {
  description = "ID of the web server security group"

  value = aws_security_group.web_sg.id
}