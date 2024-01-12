
variable "aws_access_key" {}
variable "aws_secret_key" {}

# Provider block for hashicorp vault
provider "vault" {}

# Enable aws engine in vault & credentials for vault to communicate with AWS
resource "vault_aws_secret_backend" "aws" {
   access_key = var.aws_access_key
   secret_key = var.aws_secret_key

   default_lease_ttl_seconds = "120"
   max_lease_ttl_seconds     = "240"
}

# Creates a role in vault, which will map to the AWS credential generated
resource "vault_aws_secret_backend_role" "admin" {
  backend = vault_aws_secret_backend.aws.path
  name    = "demorole"
  credential_type = "iam_user"

  policy_document = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "iam:*",
      "Resource": "*"
    }
  ]
}
EOT
}

output "backend" {
  value = vault_aws_secret_backend.aws.path
}

output "role" {
  value = vault_aws_secret_backend_role.admin.name
}

