output "environments" {
  value = {
    "dev" = {
      full_name         = "development"
      authorizer_region = "us-west-1"
      aws_account       = "12345678"
      aws_role          = "deployRole"
    }
    "stg" = {
      full_name         = "staging"
      authorizer_region = "eu-central-1"
      aws_account       = "87654321"
      aws_role          = "deployRole"
    }
  }
}