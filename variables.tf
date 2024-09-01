variable "team_name" {
    type = string
    description = "TFE Team Name"
}

variable "organization" {
  description = "TFE Organization"
  default = "clover"
}

variable "secret_role" {
  type = string
  description = "TFE Secret Role"
}

variable "policy_name" {
  type = string
  description = "Vault Policy Name"
}

variable "policy_path" {
  type = string
  description = "Vault Policy Path"
}

variable "backend" {
  type = string
  description = "TFE Backend"
}

variable "address" {
  type = string
  description = "Vault Address"
  
}