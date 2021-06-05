variable "groups" {
  type = map(object({
    policy = string
    users  = list(string)
  }))
}
