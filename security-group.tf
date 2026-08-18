
resource "aws_security_group" "web_sg" {
    name = "web_sg"
    description = "Allow TLS inbound traffic and all outbound traffic"
    
    ingress {
    description = "Allow SSH"
    from_port = 22
    to_port = 22
    protocol ="tcp"
    cidr_blocks = ["0.0.0.0/0"]    
    }
    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}
// For simple usderstanding the security group concept