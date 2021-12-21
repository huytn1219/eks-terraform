variable "create_addons" {
  description = "Controls if EKS addons should be added (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "eks_addons" {
  description = "Map of maps of `eks_addons` to create."
  type        = any
  default     = {}
}

