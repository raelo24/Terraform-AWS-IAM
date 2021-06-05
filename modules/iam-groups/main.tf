resource "aws_iam_group" "groups" {
  for_each = var.groups
  name     = each.key
}

#-
#- To use aws_iam_group_policy_attachment, we define below
#-
data "aws_iam_policy" "policy" {
  for_each = var.groups
  name     = each.value.policy
}

resource "aws_iam_group_policy_attachment" "group_policy" {
  for_each   = var.groups
  group      = each.key
  policy_arn = data.aws_iam_policy.policy[each.key].arn
  depends_on = [aws_iam_group.groups, data.aws_iam_policy.policy]
}
