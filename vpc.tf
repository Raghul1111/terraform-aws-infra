
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-vpc"
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id // Create this subnet inside the VPC that we created as aws_vpc.main 
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "terraform-public-subnet"
  }
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id //Attach this Internet Gateway to our VPC.

  tags = {
    Name = "terraform-igw"
  }
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "terraform-public-route-table"
  }
}
resource "aws_route_table_association" "public" { // Route Table Association with Public Subnet
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id // Create this subnet inside the VPC that we created as aws_vpc.main
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "terraform-private-subnet" // Private Subnet
  }
}
resource "aws_eip" "nat" { //creates an Elastic IP.
  domain = "vpc"           //tells AWS this Elastic IP is for a VPC

  tags = {
    Name = "terraform-nat-eip"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id       // Use the Elastic IP we created for this NAT Gateway
  subnet_id     = aws_subnet.public.id // Put the NAT Gateway inside our Public Subnet

  tags = {
    Name = "terraform-nat-gateway"
  }
  depends_on = [aws_internet_gateway.main] // Make sure the Internet Gateway exists before creating the NAT Gateway
}