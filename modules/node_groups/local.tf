locals {
    node_groups_expanded = {for k, v in var.node_groups : k => {
        desired_capacity              = var.workers_group_defaults["asg_desired_capacity"]
        iam_role_arn                  = var.default_iam_role_arn
        instance_types                = [var.workers_group_defaults["instance_type"]]
        key_name                      = var.workers_group_defaults["key_name"]
        launch_template_id            = var.workers_group_defaults["launch_template_id"]
        launch_template_version       = var.workers_group_defaults["launch_template_version"]
        max_capacity                  = var.workers_group_defaults["asg_max_size"]
        min_capacity                  = var.workers_group_defaults["asg_min_size"]
        subnets                       = var.workers_group_defaults["subnets"]
        disk_size                     = var.workers_group_defaults["root_volume_size"]
        taints                        = []
        update_config                 = []
        timeouts                      = var.workers_group_defaults["timeouts"]
    } if var.create_eks }

    node_groups_names = { for k, v in local.node_groups_expanded : k => lookup(
        v,
        "name",
        lookup(
            v,
            "name_prefix",
            join("-", [var.cluster_name, k])
        )
    )}
}