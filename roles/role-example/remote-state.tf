data "terraform_remote_state" "aws-bastion" {
  backend = "s3"

  config = {
    bucket = "terraform-state"
    key    = "roles/bastion"
    region = "<REGION>"
  }
}