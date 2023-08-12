resource "aws_iam_user" "users" {
  for_each                        = toset(var.users)
  name                            = each.key
}

resource "aws_iam_account_alias" "company_alias" {
  account_alias                   = var.company_alias
}

resource "aws_iam_account_password_policy" "password_policy" {
  allow_users_to_change_password = var.allow_users_to_change_password
  hard_expiry                    = var.hard_expiry
  password_reuse_prevention      = var.password_reuse_prevention
  minimum_password_length        = var.minimum_password_length
  max_password_age               = var.max_password_age
  require_lowercase_characters   = var.require_lowercase_characters
  require_uppercase_characters   = var.require_lowercase_characters
  require_numbers                = var.require_numbers
  require_symbols                = var.require_symbols
}

resource "aws_iam_user_login_profile" "login_profiles" {
  for_each                        = aws_iam_user.users
  user                            = each.value.name
  pgp_key                         = var.pgp_key
  password_length                 = 8
  password_reset_required         = var.reset_required
}

resource "aws_iam_access_key" "access_keys" {
  for_each                         = aws_iam_user.users
  user                             = each.value.name
  status                           = var.key_initial_status
}
