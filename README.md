# terraform-vault-tfe_token
Terraform Workspace

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.58.1 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_team.team](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team) | resource |
| [tfe_team_token.team](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_token) | resource |
| [vault_terraform_cloud_secret_backend.backend](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/terraform_cloud_secret_backend) | resource |
| [vault_terraform_cloud_secret_role.role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/terraform_cloud_secret_role) | resource |
| [tfe_team.team](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address"></a> [address](#input\_address) | Vault Address | `string` | n/a | yes |
| <a name="input_backend"></a> [backend](#input\_backend) | TFE Backend | `string` | n/a | yes |
| <a name="input_create_team"></a> [create\_team](#input\_create\_team) | Create a new team | `bool` | `false` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | TFE Organization | `string` | `"clover"` | no |
| <a name="input_organization_access"></a> [organization\_access](#input\_organization\_access) | Organization Access | <pre>object({<br>    manage_modules          = optional(bool, false)<br>    manage_policies         = optional(bool, false)<br>    manage_policy_overrides = optional(bool, false)<br>    manage_providers        = optional(bool, false)<br>    manage_vcs_settings     = optional(bool, false)<br>    manage_workspaces       = optional(bool, false)<br>    read_workspaces         = optional(bool, false)<br>    read_projects           = optional(bool, false)<br>  })</pre> | `{}` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Vault Policy Name | `string` | n/a | yes |
| <a name="input_policy_path"></a> [policy\_path](#input\_policy\_path) | Vault Policy Path | `string` | n/a | yes |
| <a name="input_secret_role"></a> [secret\_role](#input\_secret\_role) | TFE Secret Role | `string` | n/a | yes |
| <a name="input_team_name"></a> [team\_name](#input\_team\_name) | TFE Team Name | `string` | n/a | yes |
| <a name="input_team_visibility"></a> [team\_visibility](#input\_team\_visibility) | Team Visibility | `string` | `"secret"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->