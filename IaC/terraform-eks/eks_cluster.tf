# eks_cluster.tf
resource "aws_eks_cluster" "main" {
  name     = "my-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.subnet_a.id,
      aws_subnet.subnet_b.id
    ]
    security_group_ids = [aws_security_group.eks_sec_group.id]
  }
}

