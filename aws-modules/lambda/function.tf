data "aws_iam_policy_document" "role_sts" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

# data "aws_iam_policy_document" "role_lamda" {
#   statement {
#     actions = [
#       "lambda:InvokeFunction",
#     ]

#     effect = "Allow"
#     resources = [ 
#       "*"
#     ]
#   }
# }

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.role_sts.json
}

resource "aws_lambda_function" "function" {
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