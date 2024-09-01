data "tfe_team" "team" {
  name         = var.team_name
  organization = var.organization
}

resource "tfe_team_token" "team" {
  team_id = data.tfe_team.team.id
}

resource "vault_terraform_cloud_secret_backend" "backend" {
  address     = var.address
  backend     = var.backend
  description = "Manages the Terraform Cloud backend"
  token       = tfe_team_token.team.token
}

resource "vault_terraform_cloud_secret_role" "role" {
  backend      = vault_terraform_cloud_secret_backend.backend.backend
  name         = var.secret_role
  organization = var.organization
  team_id      = data.tfe_team.team.id
}

resource "vault_policy" "policy" {
  name   = var.policy_name
  policy = var.policy_path
  }

