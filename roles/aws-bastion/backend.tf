terraform {
  backend "s3" {
    bucket   = "terraform-state"
    key      = "roles/bastion"
    region   = "<REGION>"
    role_arn = "arn:aws:iam::<ORGANIZATION_ID>:role/<TERRAFORM_ROLE>"
  }
}