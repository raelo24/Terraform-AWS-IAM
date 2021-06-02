resource "aws_iam_policy" "policies" {
  for_each    = var.iam_policies
  name        = each.value.name
  description = each.value.description
  path        = var.path
  policy      = file(each.value.location)
}
