locals {
    node_groups_expanded = {for k, v in var.node_groups : k => merge({
        desired_capacity              = 1
        iam_role_arn                  = var.default_iam_role_arn
        instance_types                = null
        ami_type                      = null
        key_name                      = null
        launch_template_id            = null
        launch_template_version       = "$Latest"
        max_capacity                  = 10
        min_capacity                  = 1
        subnet_ids                    = var.worker_subnet_ids
        disk_size                     = null
        taints                        = []
        update_config                 = []
        timeouts                      = {}
    }, v,) if var.create_eks }
}