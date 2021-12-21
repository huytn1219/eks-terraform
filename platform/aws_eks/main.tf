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

module "launch_template" {
    source = "../../modules/launch_template"

    name = var.launch_template_name

    tags = {
        Name = "EKS-MANAGED-NODE"
    }

    depends_on = [
        module.eks
    ]
}

module "worker_node_group" {
    source = "../../modules/node_groups"

    cluster_name = var.cluster_name
    default_iam_role_arn = var.iam_node_role_arn 
    worker_subnet_ids    = var.worker_subnet_ids 
    node_groups = var.node_groups

    tags = var.tags

    depends_on = [
        module.eks,
        module.launch_template
    ]
}

## Adding CoreDNS and AWS EBS CNI as soon as worker nodes are ready
module "addons" {
    source = "../../modules/eks-addons"

    cluster_name       = var.cluster_name
    eks_addons = {
        coredns = {},
        aws-ebs-csi-driver = {},
    }

    depends_on = [
        module.worker_node_group
    ]
}