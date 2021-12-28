variable "username" {
  type    = string
  default = ""
}
variable "path" {
  type    = string
  default = "/"
}

variable "s3_policy" {
  type    = list(any)
  default = []
}
variable "policy_name" {
  type    = string
  default = ""
}