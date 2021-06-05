variable "roles" {
  type = map(object({
    name    = string
    version = string
    policy  = string
  }))
  description = "Roles with policies attached"
}

variable "force_detach" {
  type        = bool
  description = "Whether the policy can be detached to update role or restrict"
}

variable "path" {
  type        = string
  default     = "/"
  description = "Path"
}


