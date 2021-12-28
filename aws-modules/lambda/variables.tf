variable "profile_region" {
  type    = string
  default = ""
}
variable "profile" {
  type    = string
  default = ""
}
variable "aws_role_arn" {
  type    = string
  default = ""
}
variable "authorizer_status" {
  type    = string
  default = "ACTIVE"
}
variable "authorizer_disabled" {
  type    = bool
  default = true
}
variable "runtime" {
  type    = string
  default = "java11"
}
variable "filename" {
  type    = string
  default = ""
}
variable "handler" {
  type    = string
  default = ""
}
variable "function_name" {
  type    = string
  default = ""
}

variable "awsAccessKeyId" {
  type    = string
  default = ""
}
variable "awsSecretAccessKey" {
  type    = string
  default = ""
}
variable "awsBucketName" {
  type    = string
  default = ""
}
variable "awsIotArn" {
  type    = string
  default = ""
}
variable "awsRegion" {
  type    = string
  default = ""
}