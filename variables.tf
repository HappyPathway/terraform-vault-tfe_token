variable "team_name" {
  type        = string
  description = "TFE Team Name"
}

variable "organization" {
  description = "TFE Organization"
  default     = "clover"
}

variable "secret_role" {
  type        = string
  description = "TFE Secret Role"
}

variable "policy_name" {
  type        = string
  description = "Vault Policy Name"
}

variable "policy_path" {
  type        = string
  description = "Vault Policy Path"
}

variable "backend" {
  type        = string
  description = "TFE Backend"
}

variable "address" {
  type        = string
  description = "Vault Address"

}

variable "create_team" {
  type        = bool
  description = "Create a new team"
  default     = false
}

variable "team_visibility" {
  type        = string
  description = "Team Visibility"
  default     = "secret"
}

variable "organization_access" {
  type = object({
    manage_modules          = optional(bool, false)
    manage_policies         = optional(bool, false)
    manage_policy_overrides = optional(bool, false)
    manage_providers        = optional(bool, false)
    manage_vcs_settings     = optional(bool, false)
    manage_workspaces       = optional(bool, false)
    read_workspaces         = optional(bool, false)
    read_projects           = optional(bool, false)
  })
  description = "Organization Access"
  default     = {}
}