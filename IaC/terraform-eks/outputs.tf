# outputs.tf

output "kubeconfig" {
  value = <<-EOT
    apiVersion: v1
    clusters:
    - cluster:
        server: ${aws_eks_cluster.main.endpoint}
        certificate-authority-data: ${base64decode(aws_eks_cluster.main.certificate_authority[0].data)}
      name: my-cluster
    contexts:
    - context:
        cluster: my-cluster
        user: kubernetes-admin
      name: my-cluster
    current-context: my-cluster
    kind: Config
    preferences: {}
    users:
    - name: kubernetes-admin
      user:
        exec:
          apiVersion: client.authentication.k8s.io/v1beta1
          command: aws
          args:
            - "eks"
            - "get-token"
            - "--cluster-name"
            - "${aws_eks_cluster.main.name}"
  EOT
}

