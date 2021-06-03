variable "region_name" {
  default     = "us-west-2"
  description = "Region of the resources"
}

variable "pgp_key" {
  type        = string
  description = "This is a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key."
}

variable "company" {
  type        = string
  description = "Your company alias"
}
