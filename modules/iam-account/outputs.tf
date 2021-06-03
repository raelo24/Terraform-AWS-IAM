output "encrypted_passwords" {
  description = "The encrypted password of the users created"
  value = {
    for i, profile in aws_iam_user_login_profile.login_profiles :
    i => profile.encrypted_password
  }
  sensitive = false
}

output "access_key_secrets" {
  description = "The status of the access keys"
  value = {
    for i, keys in aws_iam_access_key.access_keys :
    i => keys.secret
  }
  sensitive = false
}
