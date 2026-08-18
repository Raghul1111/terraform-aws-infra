
resource "aws_security_group" "web_sg" {
    name = "web_sg"
    description = "Allow TLS inbound traffic and all outbound traffic"
}
