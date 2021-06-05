resource "aws_iam_role" "myrole" {
  for_each              = var.roles
  name                  = each.value.name
  force_detach_policies = var.force_detach
  path                  = var.path
  assume_role_policy    = file(each.value.policy)
}
