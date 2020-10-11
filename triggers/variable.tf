variable "profile" {
  description = "Name the profile in which job is to trigger"
  default     = "bio"
}

variable "region" {
  description = "Name the region in which job is to trigger"
  default     = "ap-south-1"
}

variable "name" {
  description = "name the trigger code block"
  default     = "trigger"
}

variable "jobname" {
  description = "name the job to be triggered"
  type        = list(string)
  default     = ["acc_parser", "acc_wrapper", "ecg_episodic_parser", "ecg_episodic_wrapper", "ipi_everion_parser", "ipi_everion_wrapper", "ppg_everion_parser", "ppg_everion_wrapper", "rds_episodic_data_parser", "rds_episodic_data_wrapper", "vitals_e4_parser", "vitals_e4_wrapper", "vitals_everion_parser", "vitals_everion_wrapper", "vitals_ihealth_parser", "vitals_ihealth_wrapper", "vitals_vitalpatch_parser", "vitals_vitalpatch_wrapper"]
}

variable "schedule" {
  description = "Cron expression for schedule"
  type        = list(string)
  default     = ["cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)", "cron(0 */1 * * ? *)"]
}
