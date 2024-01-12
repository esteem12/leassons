# Provider block for hashicorp vault
provider "vault" {}

variable "cred_backend" {
   default = "aws"
}
variable "cred_role_name" {
   default = "demorole"
}

# Generate Dynamic AWS Credential
data "vault_aws_access_credentials" "creds" {
  backend = var.cred_backend
  role    = var.cred_role_name
}

provider "aws" {
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
  region = "ap-south-1"
}

# Create a user using the dynamic AWS credential generated
resource "aws_iam_user" "wezvatech" {
  name = "Adam-WezvaTech-9739110917"
}
