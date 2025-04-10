# Fetch the default VPC
data "aws_vpc" "default" {
  default = true
}

# Create SG in the default VPC
resource "aws_security_group" "eks_sec_group" {
  name        = "eks-sec-group"
  description = "Allow all inbound traffic for EKS"
  vpc_id      = data.aws_vpc.default.id  # <-- 🔁 Changed this line

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

