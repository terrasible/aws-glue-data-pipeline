variable "profile" {
  description = "Name the profile for setting up crawler"
  default     = "cc-sandbox"
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
  default     = ["acc_e4_source", "acc_phillips_source", "acc_vitalpatch_source", "e4_acc_source", "e4_vitals_source", "ecg_signals_source", "everion_vitals_source", "ipi_everion_source", "ppg_everion_source", "vitalpatch_vitals_source"]
}

variable "database_list_sources" {
  description = "Name the crawler database"
  type        = list(string)
  default     = ["acc", "acc", "acc","acc", "vitals", "ecg", "vitals", "ipi", "ppg", "vitals"]
}

variable "table_prefix_sources" {
  description = "Name the region for setting up crawler"
  type        = list(string)
  default     = ["acc_", "acc_", "acc_", "acc_", "vitals_", "source_ecg_", "vitals_", "ipi_", "ppg_", "vitals_"]
}

variable "pathSources" {
  description = "Name the crawler database"
  type        = list(string)
  default     = ["acc/source=e4", "acc/source=philips", "acc/source=vitalpatch", "acc/source=e4", "vitals/source=e4", "ecg/signals", "vitals/source=everion", "ipi/source=everion", "ppg/source=everion", "vitals/source=vitalpatch"]
}


/**
 * Target
 */


variable "nameTarget" {
  description = "Name the crawler"
  type        = list(string)
  default     = ["acc_target", "e4_vitals_target", "ecg_signals_target", "everion_vitals_target", "ipi_everion_target", "ppg_everion_target", "vitalpatch_vitals_target"]
}

variable "database_list_target" {
  description = "Name the crawler database"
  type        = list(string)
  default     = ["acc", "vitals", "ecg", "vitals", "ipi", "ppg", "vitals"]
}

variable "table_prefix_target" {
  description = "Name the region for setting up crawler"
  type        = list(string)
  default     = ["acc_", "vitals_", "ecg_", "vitals_", "ipi_", "ppg_", "vitals_"]
}

variable "pathtarget" {
  description = "Name the crawler database"
  type        = list(string)
  default     = ["acc", "vitals/e4", "ecg/signals", "vitals/everion", "ipi/everion", "ppg/everion", "vitals/vitalpatch"]
}



variable "database" {
  description = "Name the crawler database"
  type        = list(string)
  default     = ["acc", "vitals", "ecg", "episodic", "ipi", "ppg"]
}

variable "source_bucket" {
  description = "Name the crawler bucket"
  default     = "crawler-bucket-bioform-cc"
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
