
resource "aws_eks_node_group" "eks_worker_group" {
  cluster_name    = "my-cluster" 
  node_group_name = "my-worker-group"
  node_role_arn   = aws_iam_role.worker_role.arn  # this role should have EKS worker policies
   # Referencing private subnets by their IDs
  subnet_ids = [
    aws_subnet.private_subnet_a.id, 
    aws_subnet.private_subnet_b.id
  ]

  depends_on = [aws_eks_cluster.main]  


  launch_template {
    id      = aws_launch_template.eks_worker.id 
    version = "$Latest"
  }

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
}


#  remote_access {
#    ec2_ssh_key = "my-ssh-key"
#  }

  



# Launch Template
resource "aws_launch_template" "eks_worker" {
  name_prefix   = "eks-worker"
  image_id      = "ami-03cf1655763a6aec9"  # Replace with latest EKS optimized AMI
  instance_type = "t3.small"

#  iam_instance_profile {
#    name = aws_iam_instance_profile.worker_profile.name
#  }

  network_interfaces {
    device_index                = 0
    associate_public_ip_address = true
    security_groups             = [aws_security_group.eks_sec_group.id]
  }
  
  user_data = base64encode(<<-EOT
    #!/bin/bash
    /etc/eks/bootstrap.sh my-cluster
  EOT
  ) 

  tag_specifications {
  resource_type = "instance"
  tags = {
    Name = "eks-worker-node"
    "kubernetes.io/cluster/my-cluster" = "owned"  # Key that links worker node to the EKS cluster
  }
}
  

  lifecycle {
    create_before_destroy = true
  }
}


# Correct Auto Scaling Group using the proper launch_template block
#resource "aws_autoscaling_group" "eks_workers" {
#  desired_capacity     = 2
#  max_size             = 3
#  min_size             = 1
#  vpc_zone_identifier  = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
#  health_check_type    = "EC2"

#  launch_template {
#    id      = aws_launch_template.eks_worker.id
#    version = "$Latest"
#  }
#}



