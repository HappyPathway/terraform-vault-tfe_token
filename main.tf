data "tfe_team" "team" {
  count        = var.create_team ? 1 : 0
  name         = var.team_name
  organization = var.organization
}

resource "tfe_team" "team" {
  count        = var.create_team ? 1 : 0
  name         = var.team_name
  organization = var.organization
  visibility   = var.team_visibility
  dynamic "organization_access" {
    for_each = var.create_team ? ["*"] : []
    content {
      manage_modules          = lookup(var.organization_access, "manage_modules", false)
      manage_policies         = lookup(var.organization_access, "manage_policies", false)
      manage_policy_overrides = lookup(var.organization_access, "manage_policy_overrides", false)
      manage_providers        = lookup(var.organization_access, "manage_providers", false)
      manage_vcs_settings     = lookup(var.organization_access, "manage_vcs_settings", false)
      manage_workspaces       = lookup(var.organization_access, "manage_workspaces", false)
      read_workspaces         = lookup(var.organization_access, "read_workspaces", false)
      read_projects           = lookup(var.organization_access, "read_projects", false)
    }
  }
  organization_access {
    manage_modules          = true
    manage_policies         = true
    manage_policy_overrides = true
    manage_providers        = true
    manage_vcs_settings     = true
    manage_workspaces       = true
    read_workspaces         = true
    read_projects           = true
  }
}


locals {
  team = var.create_team ? one(tfe_team.team) : one(data.tfe_team.team)
}

resource "tfe_team_token" "team" {
  team_id = local.team.id
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
  team_id      = local.team.id
}

resource "vault_policy" "policy" {
  name   = var.policy_name
  policy = var.policy_path
}

