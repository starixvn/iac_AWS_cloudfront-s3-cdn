locals {
  kms_key_administrators = [for user in var.admin_users : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${user}"]
}
