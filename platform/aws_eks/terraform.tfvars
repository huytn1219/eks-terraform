cluster_name = "eks-rancher"
cluster_iam_role_arn = "arn:aws:iam::420705257211:role/eksClusterRole"
cluster_security_group_ids = ["sg-028cd58d5e66bd3ac"]
cluster_subnet_ids = ["subnet-09a58215cdd68d14f", "subnet-06a5de3cf88db695d", "subnet-065c52308cacc1529"]
cluster_endpoint_public_access = true
cluster_endpoint_private_access = false
aws_region = "us-west-2"
launch_template_name = "node-1"
iam_node_role_arn = "arn:aws:iam::420705257211:role/eksNodeRole"
node_groups = {
        worker = {
            desired_capacity   = 2
            max_capacity       = 10
            min_capacity       = 1
            tags = {
                Environment = "Dev"
            }
            taints = [
                {
                    key    = "dedicated"
                    value  = "workerGroup"
                    effect = "NO_SCHEDULE"
                }
            ]
        }
    }
worker_subnet_ids = ["subnet-0cc56c10c7b64195f", "subnet-08110131054cb2b50", "subnet-08d82cb026eb5052f"]