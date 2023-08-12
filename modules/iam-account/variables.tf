variable "users" {
  type        = list(string)
  description = "List of users"
}

variable "company_alias" {
  type        = string
  description = "company alias"
}

variable "minimum_password_length" {
  type        = number
  default     = 8
  description = "Minimum length to allow for user passwords"
}

variable "max_password_age" {
  type        = number
  default     = 0
  description = "The max number of days that an user password is valid."
}

variable "password_reuse_prevention" {
  type        = number
  default     = 0
  description = "The number of previous passwords that users are prevented from reusing"
}

variable "require_lowercase_characters" {
  type        = bool
  default     = true
  description = "Require lowercase characters for user passwords"
}

variable "allow_users_to_change_password" {
  type        = bool
  default     = true
  description = "Whether to allow users to change their own password"
}

variable "hard_expiry" {
  type        = bool
  default     = false
  description = "Whether users are prevented from setting a new password after their password has expired (i.e. allow administrator reset)"
}

variable "require_uppercase_characters" {
  type        = bool
  default     = true
  description = "Require uppercase characters for user passwords"
}

variable "require_numbers" {
  type        = bool
  default     = true
  description = "Require numbers for user passwords"
}

variable "require_symbols" {
  type        = bool
  default     = true
  description = "Require symbols for user passwords"
}

variable "pgp_key" {
  type        = string
  description = "Provide a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Required to encrypt password."
}

variable "access_key_status" {
  type        = string
  default     = "Inactive"
  description = "Status of the just created access key"
}

variable "reset_required" {
  type        = bool
  default     = true
  description = "Whether the created password should be reset on first login"
}

variable "key_initial_status" {
  type        = string
  default     = "Inactive"
  description = "Inital status of the access key"
}
