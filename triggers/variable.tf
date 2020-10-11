variable "profile" {
  description = "Name the profile in which job is to trigger"
  default     = ""
}

variable "region" {
  description = "Name the region in which job is to trigger"
  default     = ""
}

variable "name" {
  description = "name the trigger code block"
  default     = ""
}

variable "jobname" {
  description = "name the job to be triggered"
  type        = list(string)
  default     = []
}

variable "schedule" {
  description = "Cron expression for schedule"
  type        = list(string)
  default     = []
}
