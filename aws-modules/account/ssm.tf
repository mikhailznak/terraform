resource "aws_ssm_parameter" "secret_key" {
  name  = "/${terraform.workspace}/${var.username}/secret_key"
  type  = "SecureString"
  value = aws_iam_access_key.access_key.secret
}

resource "aws_ssm_parameter" "access_key" {
  name  = "/${terraform.workspace}/${var.username}/access_key"
  type  = "SecureString"
  value = aws_iam_access_key.access_key.id
}