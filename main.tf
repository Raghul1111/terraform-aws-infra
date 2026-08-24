# Terraform Remote Backend
# Stores the Terraform state file securely in an Amazon S3 bucket.
# The Terraform code remains in Git; only the Terraform state is stored in S3.
# This allows team members to work with a shared remote state.
terraform {
  backend "s3" {
    bucket = "raghul-devops-terraform-state-2026" //Which S3 bucket stores the state
    key    = "terraform.tfstate"                  //Where the state is stored inside the bucket
    region = "aws_region"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "web_server" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-EC2"
  }
  vpc_security_group_ids = [aws_security_group.web_sg.id]
}