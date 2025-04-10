# vpc.tf
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_a" {
  vpc_id = data.aws_vpc.default.id
  cidr_block              = "172.31.48.0/20"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_b" {
  vpc_id = data.aws_vpc.default.id
  cidr_block              = "172.31.64.0/20"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true
}

# Private Subnet A (newly added)
resource "aws_subnet" "private_subnet_a" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = "172.31.80.0/20"  # Adjust CIDR block
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = false  # No public IP
  tags = {
    Name = "private-subnet-a"
  }
}

# Private Subnet B (newly added)
resource "aws_subnet" "private_subnet_b" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = "172.31.96.0/20"  # Adjust CIDR block
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = false  # No public IP
  tags = {
    Name = "private-subnet-b"
  }
}
