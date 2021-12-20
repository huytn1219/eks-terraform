variable "create_tpl" {
  description = "Whether to create AWS Launch template for EKS"
  type        = bool
  default     = true
}

variable "suffix" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "eks-tpl"
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "launch_template_image_id" {
  type        = string
  description = "ID of Custom AMI Image"
  default     = ""
}

variable "device_name" {
  description = " The name of the device to mount."
  type        = string
  default     = "/dev/sda1"
}

variable "delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination"
  type        = bool
  default     = true
}

variable "ebs_volume_size" {
  description = "The size of the volume in gigabytes"
  type        = string
  default     = "100"
}

variable "ebs_volume_type" {
  description = " The volume type. Can be standard, gp2, gp3, io1, io2, sc1 or st1"
  type        = string
  default     = "gp2"
}

variable "ebs_iops" {
  description = " The throughput to provision for a gp3 volume in MiB/s"
  type        = number
  default     = "3000"
}

variable "enabled_monitoring" {
    description = "Whether or not the monitoring is enabled"
    type        = bool
    default     = true
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public ip address with the network interface"
  default     = false
}

variable "security_groups" {
  type        = list(string)
  description = "A list of security group IDs to associate"
  default     = []
}

variable "delete_on_termination_nic" {
  description = "Whether the volume should be destroyed on network interface termination"
  type        = bool
  default     = true
}

variable "user_data" {
  type        = string
  description = "User data"
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

