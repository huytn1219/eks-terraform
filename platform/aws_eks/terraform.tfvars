cluster_name = "eks-rancher"
cluster_iam_role_arn = "arn:aws:iam::420705257211:role/eksClusterRole"
cluster_security_group_ids = ["sg-028cd58d5e66bd3ac"]
cluster_subnet_ids = ["subnet-0fbcaa0b014c29a4d", "subnet-04f875f128aeaf552", "subnet-06833588b4d76209b"]
cluster_endpoint_public_access = false
cluster_endpoint_private_access = true
aws_region = "us-west-2"
launch_template_name = "node-1"
iam_node_role_arn = "arn:aws:iam::420705257211:role/eksNodeRole"
node_groups = {
        worker = {
            desired_capacity   = 1
            max_capacity       = 10
            min_capacity       = 1
            launch_template_id = "lt-05d987f2d050fb88f"
            tags = {
                Environment = "Dev"
            }
            taints = []
        }
    }
worker_subnet_ids = ["subnet-0fbcaa0b014c29a4d", "subnet-04f875f128aeaf552", "subnet-06833588b4d76209b"]