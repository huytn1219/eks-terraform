# Liberty Mutual EKS

This repo contains a [Terraform](https://www.terraform.io/) code for creating [Elastic Kubernetes Service](https://aws.amazon.com/eks/) on [AWS](https://aws.amazon.com/) infrastructure.

It supports creating:
 * Elastic Kubernetes Service (EKS)


# Dependencies

* [Terraform](https://www.terraform.io/downloads.html) - v1.0.11

## Usage

```
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
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create_eks | Controls if EKS resources should be created (it affects almost all resources) | bool | true | Yes |
| cluster_enabled_log_types | A list of the desired control plane logging to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html) | list(string) | [] | No |
| cluster_name | Name of the EKS cluster. Also used as a prefix in names of related resources. | string | "" | Yes |
| cluster_iam_role_arn | ARN of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf. | string | "" | Yes |
| cluster_version | Kubernetes minor version to use for the EKS cluster (for example 1.21). | string | null | No |
| cluster_security_group_ids | If provided, the EKS cluster will be attached to this security group. If not given, a security group will be created with necessary ingress/egress to work with the workers | list(string) | [] | No |
| cluster_subnet_ids | List of subnet IDs. | list(string) | [] | Yes |
| cluster_endpoint_private_access | Indicates whether or not the Amazon EKS private API server endpoint is enabled. | bool | false | No |
| cluster_endpoint_public_access | Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`. | bool | true | No |
| cluster_endpoint_public_access_cidrs | List of CIDR blocks which can access the Amazon EKS public API server endpoint. | bool | true | Yes |
| cluster_endpoint_public_access_cidrs | List of CIDR blocks which can access the Amazon EKS public API server endpoint. | list(string) | ["0.0.0.0/0"] | . Yes |
| cluster_service_ipv4_cidr | service ipv4 cidr for the kubernetes cluster | string | null | No |
| cluster_encryption_config| Configuration block with encryption configuration for the cluster. See examples/secrets_encryption/main.tf for example format | list(object) | [] | No |
| tags | A map of tags to add to all resources. Tags added to launch configuration or templates override these values for ASG Tags only. | map(string) | {} | No |
| cluster_tags| A map of tags to add to just the eks resource. | map(string) | {} | No |
| cluster_create_timeout | Timeout value when creating the EKS cluster. | string | "30m" | No |
| cluster_delete_timeout | Timeout value when deleting the EKS cluster. | string | "15m" | No |
| cluster_update_timeout | Timeout value when updating the EKS cluster. | string | "60m" | No |

