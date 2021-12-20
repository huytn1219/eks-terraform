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

    name                     = "node-1"
    launch_template_image_id = "ami-074251216af698218"
    security_groups          = ["sg-028cd58d5e66bd3ac"]
    user_data = <<-EOT
        #!/bin/zbash -x
        sudo bash -c 'cat <<EOF > /etc/sysctl.d/90-kubelet.conf
        vm.overcommit_memory = 1
        vm.panic_on_oom = 0
        kernel.panic = 10
        kernel.panic_on_oops = 1
        kernel.keys.root_maxkeys = 1000000
        kernel.keys.root_maxbytes = 25000000
        EOF'
    EOT

    depends_on = [
        module.eks
    ]
}

module "node_groups" {
    source = "../../modules/node_groups"

    cluster_name = "eks-rancher"
    default_iam_role_arn = "arn:aws:iam::420705257211:role/eksNodeRole"
    workers_group_defaults = local.workers_group_defaults
    node_groups = {
        example = {
            desired_capacity   = 1
            max_capacity       = 10
            min_capacity       = 1
            launch_template_id = module.launch_template.*.id
            taints = [
                {
                    Environment = "Dev"
                }
            ]
        }
    } 

    tags = var.tags

    depends_on = [
        module.eks
    ]
}