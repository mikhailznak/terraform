variable "runtime" {
  type    = string
  default = "java11"
}
variable "filename" {
  type    = string
  default = ""
}
variable "handler" {
  type = string
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
