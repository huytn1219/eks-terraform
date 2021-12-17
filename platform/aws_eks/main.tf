# ---------------------------------------------------------------------------------------------------------------------
# Create EKS
# ---------------------------------------------------------------------------------------------------------------------

module "eks" {
    source = "../../modules/eks_cluster"

    cluster_name                         = var.cluster_name
    cluster_version                      = var.cluster_version
    cluster_iam_role_arn                 = var.cluster_iam_role_arn
    cluster_security_group_ids           = var.cluster_security_group_ids
    cluster_subnet_ids                   = var.cluster_subnet_ids
    cluster_endpoint_private_access      = var.cluster_endpoint_private_access
    cluster_endpoint_public_access       = var.cluster_endpoint_public_access
    cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
    cluster_service_ipv4_cidr            = var.cluster_service_ipv4_cidr
    tags                                 = var.tags
    cluster_tags                         = var.cluster_tags
}