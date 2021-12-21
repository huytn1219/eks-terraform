locals {
    eks_addons = { for k, v in var.eks_addons : k => merge(
        {
        addon_version            = null
        resolve_conflicts        = "NONE"
        service_account_role_arn = null
    }, v,) if var.create_addons }
}