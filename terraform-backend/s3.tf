provider "aws" {
  region = "aws_region"
}
resource "aws_s3_bucket" "terraform_state" {
  bucket = "raghul-devops-terraform-state-2026"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}