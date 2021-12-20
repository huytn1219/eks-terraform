# ---------------------------------------------------------------------------------------------------------------------
# Create EKS
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_eks_cluster" "this" {
    count = var.create_eks ? 1 : 0

    name                        = var.cluster_name
    enabled_cluster_log_types   = var.cluster_enabled_log_types
    role_arn                    = var.cluster_iam_role_arn
    version                     = var.cluster_version

    vpc_config {
        security_group_ids      = var.cluster_security_group_ids
        subnet_ids              = var.cluster_subnet_ids
        endpoint_private_access = var.cluster_endpoint_private_access
        endpoint_public_access  = var.cluster_endpoint_public_access
        public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
    }

    kubernetes_network_config {
        service_ipv4_cidr = var.cluster_service_ipv4_cidr
    }

    dynamic "encryption_config" {
    for_each = toset(var.cluster_encryption_config)

    content {
      provider {
        key_arn = encryption_config.value["provider_key_arn"]
      }
      resources = encryption_config.value["resources"]
      }
    }

    tags = merge(
      var.tags,
      var.cluster_tags,
    )

    timeouts {
      create = var.cluster_create_timeout
      delete = var.cluster_delete_timeout
      update = var.cluster_update_timeout
    }
}

resource "aws_eks_addon" "addons" {
  for_each = var.cluster_addons

  cluster_name = var.cluster_name
  addon_name   = each.value

  depends_on = [
    aws_eks_cluster.this
  ]
}