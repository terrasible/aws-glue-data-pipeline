variable "profile" {
  description = "Name the profile for setting up IAM group"
  default     = ""
}

variable "region" {
  description = "Name the region for setting up IAM group"
  default     = "ap-southeast-1"
}

variable "devadmin" {
  description = "Name the IAM"
  default     = "full-access-for-devadmin"
}

variable "deviamronly" {
  description = "Name the IAM"
  default     = "read-write-access-for-deviamronly"
}

variable "psadmin" {
  description = "Name the IAM"
  default     = "read-write-access-for-psadmin"
}

variable "psiamronly" {
  description = "Name the IAM"
  default     = "read-write-access-for-psiamronly"
}

variable "groups" {
  description = "Create IAM Groups with these names"
  type        = list(string)
  default     = [ "managers", "App_Devlopment"]
}

variable "policy" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["admin"]
}

variable "env" {
  description = "Name the env"
  default     = "dev"
}
