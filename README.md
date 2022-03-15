<p align="center">
  <a href="https://launchrack.com/" target="_blank" rel="homepage">
  <img src="https://launchrack.com/assets/img/logo_launchrack.png" alt="LaunchRack logo" style="width: 600px;" class="d-md-inline-block">
  </a>
</p>

<p>
We are huge followers of the <b>Cloud-Native DevOps</b> movement and are firm believers in the power of treating <b>Infrastructure as Code</b> using immutable architecture & <b>GitOps</b> style deployments. We adhere to a strict automation mindset (automation first, as opposed to manual first with automation later) and strive to provide the best technical acumen that will enable organizations improve <b>Cloud Security</b> Posture, <b>Release</b> More Often, <b>Scale</b> with Demand, Brace <b>Agility</b>, Operate within <b>Budget</b> and focus on value derived by the time saved on the execution of a task rather than having to spend cycles on design & tool selection.
</p>

<p>
  <h4 align="center"> 
    Our consistent and automated processes can help you improve:
  </h4>
</p>

<div style="margin:0 auto;width:400px">
  <p style="text-align: left;">
    <span style="color:green">✔</span> Better <b>utilization</b> of cloud resources by 40% <br>
    <span style="color:green">✔</span> Self-service infrastructure <b>provisioning</b> by 35% <br>
    <span style="color:green">✔</span> <b>Security</b> and governance by 30% <br>
    <span style="color:green">✔</span> Return on value/investment by 20% <br>
    <span style="color:green">✔</span> Team management & <b>governance</b> by 15% <br>
    <span style="color:green">✔</span> Earlier <b>detection</b> of bugs by 32% <br>
    <span style="color:green">✔</span> Response to issues/events by 23% <br>
  </p>
</div>

<p>
  <h4 align="center">
    Chat more?
    <a href="mailto:info@launchrack.com">Email</a>
    <span style="color:white"> | </span> 
    <a href="https://launchrack.com/contact/" target="_blank">Contact us</a>
  </h4>
</p>
<p align="center">
     <a href="https://www.linkedin.com/company/launchrack"> 
     <img alt="linkedin logo" src="https://user-images.githubusercontent.com/100512415/158441415-f399bf91-f65a-4568-8882-2785715c86b0.png" style="height: 20px;width: 20px;"/>
     </a>
     <a href="https://www.twitter.com/launchrack">
     <img alt="twitter logo" src="https://user-images.githubusercontent.com/100512415/158441443-3851792d-2a40-47f6-a45a-7f576134797b.png" style="height: 20px;width: 20px;"/>
     </a>
     <a href="https://www.facebook.com/launchrack">
     <img alt="facebook logo" src="https://user-images.githubusercontent.com/100512415/158447347-2068d8c1-80fa-4f15-a9a0-7aeff94a7fd9.png" style="height: 20px;width: 20px;"/>
     </a>
</p>

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

## Requirements
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 4.0 |
| <a name="requirement_local"></a> [local](#requirement_local) | ~> 2.0 |
| <a name="requirement_null"></a> [null](#requirement_null) | ~> 3.0 |

## Providers
| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | ~> 4.0 |

## Resources
| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_access_key.this_no_pgp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_login_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_user_ssh_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_ssh_key) | resource |

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_iam_access_key"></a> [create_iam_access_key](#input_create_iam_access_key) | Whether to create IAM access key. | `bool` | `true` | no |
| <a name="input_create_iam_user_login_profile"></a> [create_iam_user_login_profile](#input_create_iam_user_login_profile) | Whether to create IAM user login profile. | `bool` | `true` | no |
| <a name="input_create_user"></a> [create_user](#input_create_user) | Whether to create the IAM user. | `bool` | `true` | no |
| <a name="input_force_destroy"></a> [force_destroy](#input_force_destroy) | When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input_name) | Desired name for the IAM user. | `string` | n/a | yes |
| <a name="input_password_length"></a> [password_length](#input_password_length) | The length of the generated password. | `number` | `20` | no |
| <a name="input_password_reset_required"></a> [password_reset_required](#input_password_reset_required) | Whether the user should be forced to reset the generated password on first login. | `bool` | `true` | no |
| <a name="input_path"></a> [path](#input_path) | Desired path for the IAM user. | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions_boundary](#input_permissions_boundary) | The ARN of the policy that is used to set the permissions boundary for the user. | `string` | `""` | no |
| <a name="input_pgp_key"></a> [pgp_key](#input_pgp_key) | Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. Used to encrypt password and access key. | `string` | `""` | yes |
| <a name="input_ssh_key_encoding"></a> [ssh_key_encoding](#input_ssh_key_encoding) | Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM. | `string` | `"SSH"` | no |
| <a name="input_ssh_public_key"></a> [ssh_public_key](#input_ssh_public_key) | The SSH public key. The public key must be encoded in ssh-rsa format or PEM format. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input_tags) | A map of tags for the resources. | `map(string)` | `{}` | no |
| <a name="input_upload_iam_user_ssh_key"></a> [upload_iam_user_ssh_key](#input_upload_iam_user_ssh_key) | Whether to upload a public ssh key to the IAM user. | `bool` | `false` | no |

## Outputs
| Name | Description |
|------|-------------|
| <a name="output_keybase_password_decrypt_command"></a> [keybase_password_decrypt_command](#output_keybase_password_decrypt_command) | The keybase password decrypt command. |
| <a name="output_keybase_password_pgp_message"></a> [keybase_password_pgp_message](#output_keybase_password_pgp_message) | The keybase password pgp message. |
| <a name="output_keybase_secret_key_decrypt_command"></a> [keybase_secret_key_decrypt_command](#output_keybase_secret_key_decrypt_command) | The keybase secret key decrypt command. |
| <a name="output_keybase_secret_key_pgp_message"></a> [keybase_secret_key_pgp_message](#output_keybase_secret_key_pgp_message) | The keybase secret key pgp message. |
| <a name="output_pgp_key"></a> [pgp_key](#output_pgp_key) | PGP key used to encrypt sensitive data for this user. (if empty - secrets are not encrypted) |
| <a name="output_this_iam_access_key_encrypted_secret"></a> [this_iam_access_key_encrypted_secret](#output_this_iam_access_key_encrypted_secret) | The encrypted secret, base64 encoded. |
| <a name="output_this_iam_access_key_id"></a> [this_iam_access_key_id](#output_this_iam_access_key_id) | The access key ID. |
| <a name="output_this_iam_access_key_key_fingerprint"></a> [this_iam_access_key_key_fingerprint](#output_this_iam_access_key_key_fingerprint) | The fingerprint of the PGP key used to encrypt the secret. |
| <a name="output_this_iam_access_key_secret"></a> [this_iam_access_key_secret](#output_this_iam_access_key_secret) | The access key secret. |
| <a name="output_this_iam_access_key_ses_smtp_password"></a> [this_iam_access_key_ses_smtp_password](#output_this_iam_access_key_ses_smtp_password) | The secret access key converted into an SES SMTP password. |
| <a name="output_this_iam_access_key_status"></a> [this_iam_access_key_status](#output_this_iam_access_key_status) | Active or Inactive. Keys are initially active, but can be made inactive by other means. |
| <a name="output_this_iam_user_arn"></a> [this_iam_user_arn](#output_this_iam_user_arn) | The ARN assigned by AWS for this user. |
| <a name="output_this_iam_user_login_profile_encrypted_password"></a> [this_iam_user_login_profile_encrypted_password](#output_this_iam_user_login_profile_encrypted_password) | The encrypted password, base64 encoded. |
| <a name="output_this_iam_user_login_profile_key_fingerprint"></a> [this_iam_user_login_profile_key_fingerprint](#output_this_iam_user_login_profile_key_fingerprint) | The fingerprint of the PGP key used to encrypt the password. |
| <a name="output_this_iam_user_name"></a> [this_iam_user_name](#output_this_iam_user_name) | The user's name. |
| <a name="output_this_iam_user_ssh_key_fingerprint"></a> [this_iam_user_ssh_key_fingerprint](#output_this_iam_user_ssh_key_fingerprint) | The MD5 message digest of the SSH public key. |
| <a name="output_this_iam_user_ssh_key_ssh_public_key_id"></a> [this_iam_user_ssh_key_ssh_public_key_id](#output_this_iam_user_ssh_key_ssh_public_key_id) | The unique identifier for the SSH public key. |
| <a name="output_this_iam_user_unique_id"></a> [this_iam_user_unique_id](#output_this_iam_user_unique_id) | The unique ID assigned by AWS. |

## Authors
This module is maintained by our awsome platform engineering team. Here are our [contributors](https://github.com/LaunchRack/terraform-aws-iam-user/graphs/contributors)

## License
See [LICENSE](https://github.com/LaunchRack/terraform-aws-iam-user/blob/master/LICENSE) for full details

## Trademarks
All other trademarks referenced herein are the property of their respective owners
