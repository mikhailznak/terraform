provider "aws" {
  region = data.terraform_remote_state.aws-bastion.outputs.environments[terraform.workspace].authorizer_region
  assume_role {
    session_name = terraform.workspace
    role_arn     = "arn:aws:iam::${data.terraform_remote_state.aws-bastion.outputs.environments[terraform.workspace].aws_account}:role/${data.terraform_remote_state.aws-bastion.outputs.environments[terraform.workspace].aws_role}"
  }
}