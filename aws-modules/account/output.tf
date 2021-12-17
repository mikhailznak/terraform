output "secret_key" {
  value = aws_iam_access_key.access_key.secret
}

output "access_key" {
  value = aws_iam_access_key.access_key.id
}