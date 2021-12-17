resource "aws_iam_user" "user" {
  name = var.username
  path = var.path

  tags = {
    source = "terraform"
  }
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.user.name
}

data "aws_iam_policy_document" "s3_policy" {
  dynamic "statement" {
    for_each = var.s3_policy
    content {
      actions   = lookup(statement.value, "actions")
      resources = lookup(statement.value, "resources")
      effect    = lookup(statement.value, "effect")
    }
  }
  #   statement {
  #     actions   = ["s3:GetObject"]
  #     resources = ["arn:aws:s3:::*/*"]
  #     effect = "Allow"
  #   }
}

resource "aws_iam_user_policy" "policy" {
  name = var.policy_name
  user = aws_iam_user.user.name

  policy = data.aws_iam_policy_document.s3_policy.json

  #   <<EOF
  # {
  #   "Version": "2012-10-17",
  #   "Statement": [
  #     {
  #       "Action": [
  #         "s3:GetObject"
  #       ],
  #       "Effect": "Allow",
  #       "Resource": ["arn:aws:s3:::*/*"]
  #     }
  #   ]
  # }
  # EOF
}