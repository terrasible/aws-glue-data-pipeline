variable "profile" {
  description = "Name the profile for setting up IAM group"
  default     = ""
}

variable "region" {
  description = "Name the region for setting up IAM group"
  default     = ""
}

variable "id" {
  description = "Name the role ID"
  default     = ""
}

variable "src_bucket_name" {
  description = "Name the source bucket"
  default     = "cross-example-bkt"
}

variable "src_bucket_arn" {
  description = "Name the source bucket"
  default     = ""
}

variable "src_region" {
  description = "Name the region for source bucket"
  default     = ""
}

variable "dst_bucket_name" {
  description = "Name the destination bucket"
  default     = ""
}

variable "dst_bucket_arn" {
  description = "Name the destination bucket"
  default     = ""
}

variable "dst_region" {
  description = "Name the region for destination bucket"
  default     = ""
}

variable "role_arn" {
  description = "Name the region for setting up IAM group"
  default     = ""
}
