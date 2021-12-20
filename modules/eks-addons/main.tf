resource "aws_eks_addon" "this" {
  for_each = local.eks_addons

  cluster_name             = var.cluster_name

  addon_name               = each.key
  addon_version            = lookup(each.value, "addon_version", null)
  resolve_conflicts        = lookup(each.value, "resolve_conflicts", "NONE")
  service_account_role_arn = lookup(each.value, "service_account_role_arn", null)

  tags = var.tags
}