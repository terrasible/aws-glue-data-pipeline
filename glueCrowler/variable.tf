variable "profile" {
  description = "Name the profile for setting up crawler"
  default     = ""
}

variable "region" {
  description = "Name the region for setting up crawler"
  default     = "ap-southeast-1"
}

/**
 * Sources
 */

variable "nameSources" {
  description = "Name the crawler"
  type        = list(string)
  default     = []
}

variable "database_list_sources" {
  description = "Name the crawler database"
  type        = list(string)
  default     = []
}

variable "table_prefix_sources" {
  description = "Name the region for setting up crawler"
  type        = list(string)
  default     = []
}

variable "pathSources" {
  description = "Name the crawler database"
  type        = list(string)
  default     = []
}


/**
 * Target
 */


variable "nameTarget" {
  description = "Name the crawler"
  type        = list(string)
  default     = []
}

variable "database_list_target" {
  description = "Name the crawler database"
  type        = list(string)
  default     = []
}

variable "table_prefix_target" {
  description = "Name the region for setting up crawler"
  type        = list(string)
  default     = []
}

variable "pathtarget" {
  description = "Name the crawler database"
  type        = list(string)
  default     = []
}



variable "database" {
  description = "Name the crawler database"
  type        = list(string)
  default     = []
}

variable "source_bucket" {
  description = "Name the crawler bucket"
  default     = "src-example"
}

variable "target_bucket" {
  description = "Name the crawler bucket"
  default     = ""
}

variable "env" {
  description = "Name the crawler Environment"
  default     = "dev"
}

variable "crawlerRole" {
  description = "Name the crawler crawlerRole"
  default     = "crawler-custom-role"
}

variable "policyName" {
  description = "Name the crawler crawlerRole"
  default     = "crawler-custom-policy"
}
