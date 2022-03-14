<p align="center">
  <a href="https://launchrack.com/" target="_blank" rel="homepage">
  <img src="https://launchrack.com/assets/img/logo_launchrack.png" alt="LaunchRack logo" style="width: 600px;" class="d-md-inline-block">
  </a>
</p>
<br>
<br>
<p><h4 align="center">Need help with Cloud-Native DevOps? <a href="https://launchrack.com/contact/" target="_blank" rel="contactus"> GET IN TOUCH</a></h4></p>

---

# Terraform AWS IAM user

[![GitHub license](https://img.shields.io/github/license/launchrack/terraform-aws-iam-user?color=blue)](https://github.com/LaunchRack/terraform-aws-iam-user/blob/main/LICENSE)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/launchrack/terraform-aws-iam-user?color=blue&display_name=release)

Creates IAM user, IAM login profile, IAM access key and Uploads IAM SSH user public key. All of these are optional resources.

> **Note:**
> - If possible, always use PGP encryption (via keybase) to prevent Terraform from keeping unencrypted password and access secret key in state file
> - When `pgp_key` is specified as `keybase:username`, make sure that the user has already uploaded public key to keybase.io. For example, user's public key with username `test` can be verified [here](https://keybase.io/test/pgp_keys.asc)
> - This module outputs commands and PGP messages which can be decrypted either using [keybase.io](https://keybase.io/decrypt) website or using command line to get user's password and user's secret key

**Attribution**: This module is a slightly improvised version of the [community repository](https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-user)

## Features
- Creates IAM user
- Creates IAM login profile
- Creates IAM access key
- Uploads IAM SSH user public key

## Usage
```hcl
module "aws_iam_user" {
  source         = "git::https://github.com/LaunchRack/terraform-aws-iam-user.git"

  name           = "test"
  force_destroy  = true
  pgp_key        = "keybase:test" # keybase user name

  tags = {
    BusinessUnit = "tools"
    Application  = "cicd"
  }
}
```

## Setup Instructions
`terraform init`

`terraform plan` # use `-var-file=terraform.tfvars` if you plan to use a different file for the value overrides. See [examples](https://github.com/LaunchRack/terraform-aws-iam-user/blob/main/examples/terraform.tfvars) folder

`terraform apply -auto-approve` # use `-var-file=terraform.tfvars` if you plan to use a different file for the value overrides. See [examples](https://github.com/LaunchRack/terraform-aws-iam-user/blob/main/examples/terraform.tfvars) folder


> **Note:** The `terraform.tfvars` file will need to be created in the root directory with value overrides

## Inputs
| Name | Description | Type | Default | Required |
| ----------- | ----------- | ----------- | ----------- | ----------- |
| create_iam_access_key | Whether to create IAM access key. | `bool` | `true` | no |
| create_iam_user_login_profile | Whether to create IAM user login profile. | `bool` | `true` | no |
| create_user | Whether to create the IAM user. | `bool` | `true` | no |
| force_destroy | When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed. | `bool` | `false` | no |
| name | Desired name for the IAM user. | `string` | `n/a` | yes |
| password_length | The length of the generated password. | `number` | `20` | no |
| password_reset_required | Whether the user should be forced to reset the generated password on first login. | `bool` | `true` | no |
| path | Desired path for the IAM user. | `string` | `"/"` | no |
| permissions_boundary | The ARN of the policy that is used to set the permissions boundary for the user. | `string` | `""` | no |
| pgp_key | Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key. | `string` | `""` | yes |
| ssh_key_encoding | Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM. | `string` | `"SSH"` | no |
| ssh_public_key | The SSH public key. The public key must be encoded in ssh-rsa format or PEM format. | `string` | `""` | no |
| tags | A map of tags for the resources. | `map(string)` | `{}` | no |
| upload_iam_user_ssh_key | Whether to upload a public ssh key to the IAM user. | `bool` | `false` | no |

## Outputs
| Name | Description |
| ----------- | ----------- |
| keybase_password_decrypt_command | The keybase password decrypt command. |
| keybase_password_pgp_message | The keybase password pgp message. |
| keybase_secret_key_decrypt_command | The keybase secret key decrypt command. |
| keybase_secret_key_pgp_message | The keybase secret key pgp message. |
| pgp_key | PGP key used to encrypt sensitive data for this user. (if empty - secrets are not encrypted) |
| this_iam_access_key_encrypted_secret | The encrypted secret, base64 encoded. |
| this_iam_access_key_id | The access key ID. |
| this_iam_access_key_key_fingerprint | The fingerprint of the PGP key used to encrypt the secret. |
| this_iam_access_key_secret | The access key secret. |
| this_iam_access_key_ses_smtp_password | The secret access key converted into an SES SMTP password. |
| this_iam_access_key_status | Active or Inactive. Keys are initially active, but can be made inactive by other means. |
| this_iam_user_arn | The ARN assigned by AWS for this user. |
| this_iam_user_login_profile_encrypted_password | The encrypted password, base64 encoded. |
| this_iam_user_login_profile_key_fingerprint | The fingerprint of the PGP key used to encrypt the password. |
| this_iam_user_name | The user's name. |
| this_iam_user_ssh_key_fingerprint | The MD5 message digest of the SSH public key. |
| this_iam_user_ssh_key_ssh_public_key_id | The unique identifier for the SSH public key. |
| this_iam_user_unique_id | The unique ID assigned by AWS. |

## Authors
This module is maintained by our awsome platform engineering team. Here are our [contributors](https://github.com/LaunchRack/terraform-aws-iam-user/graphs/contributors)

## License
See [LICENSE](https://github.com/LaunchRack/terraform-aws-iam-user/blob/master/LICENSE) for full details

## Trademarks
All other trademarks referenced herein are the property of their respective owners
