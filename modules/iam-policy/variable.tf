variable "name" {
  type        = string
  default     = "policies"
  description = "Name of policy"
}

variable "iam_policies" {
  type = map(object({
    name        = string
    description = string
    location    = string
  }))
}

variable "path" {
  type        = string
  default     = "/"
  description = "Path folder of the policy"
}
