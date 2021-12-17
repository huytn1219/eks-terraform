
output "cluster_id" {
  description = "The name/id of the EKS cluster. Will block on cluster creation until the cluster is really ready."
  value       = coalescelist(aws_eks_cluster.this[*].id, [""])[0]
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster."
  value       = coalescelist(aws_eks_cluster.this[*].arn, [""])[0]
}

output "cluster_certificate_authority_data" {
  description = "Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster."
  value       = coalescelist(aws_eks_cluster.this[*].certificate_authority[0].data, [""])[0]
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = coalescelist(aws_eks_cluster.this[*].endpoint, [""])[0]
}

output "cluster_version" {
  description = "The Kubernetes server version for the EKS cluster."
  value       = element(concat(aws_eks_cluster.this[*].version, [""]), 0)
}