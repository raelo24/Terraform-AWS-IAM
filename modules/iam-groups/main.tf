resource "aws_iam_group" "groups" {
  for_each = toset(var.groups)
  name     = each.key
}
