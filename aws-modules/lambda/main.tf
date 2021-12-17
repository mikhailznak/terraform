resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "func" {
  filename         = var.filename
  function_name    = var.function_name
  source_code_hash = filebase64sha256("${var.filename}")
  role             = aws_iam_role.iam_for_lambda.arn
  runtime          = var.runtime
  handler          = var.handler
  environment {
    variables = {
      awsAccessKeyId     = var.awsAccessKeyId
      awsSecretAccessKey = var.awsSecretAccessKey
      awsBucketName      = var.awsBucketName
      awsIotArn          = var.awsIotArn
      awsRegion          = var.awsRegion
    }
  }
}

resource "aws_iot_authorizer" "authorizer" {
  name                    = "${var.function_name}-authorizer"
  authorizer_function_arn = aws_lambda_function.func.arn
  signing_disabled        = true
  status                  = "ACTIVE"
}