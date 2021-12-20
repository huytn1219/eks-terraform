locals {
    workers_group_defaults = {
        name                     = "test"
        tags                     = []
        asg_desired_capacity     = "1"
        asg_max_size             = "3"
        asg_min_size             = "1"
        instance_type            = "t3.micro"
        key_name                 = ""
        launch_template_id       = null
        launch_template_version  = "$Latest"
        subnets                  = var.worker_subnet_ids
        root_volume_size         = "50"
        timeouts                 = {}
    }

    eks_addon_defaults = {
        eks_addon_version     = null
        eks_resolve_conflicts = null
        eks_sa_role_arn       = null
    }
}