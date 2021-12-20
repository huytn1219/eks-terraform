variable "create_eks" {
  description = "Controls if EKS resources should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "cluster_enabled_log_types" {
  description = "A list of the desired control plane logging to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)"
  type        = list(string)
  default     = []
}

variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = ""
}

variable "cluster_iam_role_arn" {
    description = "ARN of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf."
    type        = string
    default     = ""
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)."
  type        = string
  default     = null
}

variable "cluster_security_group_ids" {
  description = "If provided, the EKS cluster will be attached to this security group. If not given, a security group will be created with necessary ingress/egress to work with the workers"
  type        = list(string)
  default     = []
}

variable "cluster_subnet_ids" {
    description = "List of subnet IDs."
    type        = list(string)
    default     = []
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}

variable "cluster_encryption_config" {
  description = "Configuration block with encryption configuration for the cluster. See examples/secrets_encryption/main.tf for example format"
  type = list(object({
    provider_key_arn = string
    resources        = list(string)
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to add to all resources. Tags added to launch configuration or templates override these values for ASG Tags only."
  type        = map(string)
  default     = {}
}

variable "cluster_tags" {
  description = "A map of tags to add to just the eks resource."
  type        = map(string)
  default     = {}
}

variable "cluster_create_timeout" {
  description = "Timeout value when creating the EKS cluster."
  type        = string
  default     = "30m"
}

variable "cluster_delete_timeout" {
  description = "Timeout value when deleting the EKS cluster."
  type        = string
  default     = "15m"
}

variable "cluster_update_timeout" {
  description = "Timeout value when updating the EKS cluster."
  type        = string
  default     = "60m"
}

variable "cluster_addons" {
  description = "EKS add-on(s)"
  type        = set(string)
}