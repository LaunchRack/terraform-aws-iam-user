variable "region" {
  description = "The region to provision resources in."
  type        = string
}

variable "name" {
  description = "Desired name for the IAM user."
  type        = string
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  type        = bool
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. Used to encrypt password and access key."
  type        = string
}

variable "tags" {
  description = "A map of tags for the resources."
  type        = map(string)
}
