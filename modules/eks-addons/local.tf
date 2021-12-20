locals {
    eks_addons = { for k, v in var.eks_addons : k => {
        addon_version            = var.eks_addon_defaults["eks_addon_version"]
        resolve_conflicts        = var.eks_addon_defaults["eks_resolve_conflicts"]
        service_account_role_arn = var.eks_addon_defaults["eks_sa_role_arn"]
    } if var.create_addons }
}