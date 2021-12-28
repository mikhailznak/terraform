resource "null_resource" "set_default_authorizer" {
  #   triggers = {
  #     always_run = "${timestamp()}"
  #   }
  provisioner "local-exec" {
    command = <<EOF
        echo '' >> ~/.aws/config
        echo "[profile ${var.profile}]" >> ~/.aws/config
        echo "region = ${var.profile_region}" >> ~/.aws/config
        echo "role_arn = ${var.aws_role_arn}" >> ~/.aws/config
        echo "source_profile = default" >> ~/.aws/config

        aws lambda add-permission --function-name ${var.function_name} --principal iot.amazonaws.com --source-arn ${aws_lambda_function.function.arn} --statement-id Id-123 --action 'lambda:InvokeFunction' --profile ${var.profile}
        aws iot set-default-authorizer --authorizer-name ${var.function_name}-authorizer --profile ${var.profile}
    EOF
  }
  depends_on = [
    aws_iot_authorizer.authorizer
  ]

}
resource "aws_iot_authorizer" "authorizer" {
  name                    = "${var.function_name}-authorizer"
  authorizer_function_arn = aws_lambda_function.function.arn
  signing_disabled        = var.authorizer_disabled
  status                  = var.authorizer_status
}