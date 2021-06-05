provider "aws" {
  region = var.region_name

  default_tags {
    tags = {
      Environment = "dev"
    }
  }
}

module "policies" {
  source = "./modules/iam-policy"
  #convert to map so terraform can have identifier for each
  iam_policies = {
    for policy in local.iam_policies :
    policy.name => policy
  }
}

module "account" {
  source                         = "./modules/iam-account"
  users                          = local.iam_users
  allow_users_to_change_password = local.iam_account.user_change_password
  pgp_key                        = var.pgp_key
  company_alias                  = local.iam_account.company_alias
}

module "roles" {
  source       = "./modules/iam-role"
  force_detach = true
  roles = {
    for role in local.iam_roles :
    role.name => role
  }
}

module "groups" {
  source     = "./modules/iam-groups"
  groups     = local.iam_groups
  depends_on = [module.policies]
}
