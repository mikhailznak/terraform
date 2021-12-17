variable "username" {
  type    = string
  default = ""
}
variable "path" {
  type    = string
  default = "/"
}

variable "s3_policy" {
  type = list(any)
  default = [
    {
      "actions"   = ["s3:GetObject"]
      "resources" = ["arn:aws:s3:::*/*"]
      "effect"    = "Allow"
    }
  ]
}
variable "policy_name" {
  type    = string
  default = ""
}