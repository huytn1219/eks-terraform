
variable "create_eks" {
  description = "Controls if EKS resources should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "workers_group_defaults" {
  description = "Workers group defaults from parent"
  type        = any
  default     = {}
}

variable "cluster_name" {
  description = "Name of parent cluster"
  type        = string
  default     = ""
}

variable "default_iam_role_arn" {
  description = "ARN of the default IAM worker role to use if one is not specified in `var.node_groups` or `var.node_groups_defaults`"
  type        = string
  default     = ""
}

variable "node_groups" {
  description = "Map of maps of `eks_node_groups` to create. See \"`node_groups` and `node_groups_defaults` keys\" section in README.md for more details"
  type        = any
  default     = {}
}

variable "ebs_optimized_not_supported" {
  description = "List of instance types that do not support EBS optimization"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

