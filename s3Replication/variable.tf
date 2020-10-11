variable "profile" {
  description = "Name the profile for setting up IAM group"
  default     = "cc-sandbox"
}

variable "region" {
  description = "Name the region for setting up IAM group"
  default     = "ap-southeast-1"
}

variable "id" {
  description = "Name the role ID"
  default     = "ap-southeast-1"
}

variable "src_bucket_name" {
  description = "Name the source bucket"
  default     = "cross-acc-share-gunj-db"
}

variable "src_bucket_arn" {
  description = "Name the source bucket"
  default     = "arn:aws:s3:::cross-acc-share-gunj-db"
}

variable "src_region" {
  description = "Name the region for source bucket"
  default     = "ap-southeast-1"
}

variable "dst_bucket_name" {
  description = "Name the destination bucket"
  default     = "replication-bio-terra"
}

variable "dst_bucket_arn" {
  description = "Name the destination bucket"
  default     = "arn:aws:s3:::s3-replication-bio-terra"
}

variable "dst_region" {
  description = "Name the region for destination bucket"
  default     = "ap-south-1"
}

variable "role_arn" {
  description = "Name the region for setting up IAM group"
  default     = "arn:aws:iam::626505363333:role/S3-Replication"
}
