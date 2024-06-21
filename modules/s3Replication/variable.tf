/**
 * Variables for S3 Replication Configuration
 */

# Profile for setting up IAM roles (optional)
variable "profile" {
  description = "Name of the profile for setting up IAM roles"
  type        = string
  default     = ""
}

# Source bucket configuration
variable "src_bucket_name" {
  description = "The name of the source S3 bucket."
  type        = string
  default     = "cross-example-bkt"
  validation {
    condition     = length(var.src_bucket_name) > 0
    error_message = "Source bucket name must not be empty."
  }
}

variable "src_bucket_arn" {
  description = "The ARN of the source S3 bucket."
  type        = string
  validation {
    condition     = length(var.src_bucket_arn) > 0
    error_message = "Source bucket ARN must not be empty."
  }
}

variable "source_region" {
  description = "The AWS region for the source bucket."
  type        = string
  default     = "us-west-2"
  validation {
    condition     = length(var.source_region) > 0
    error_message = "Source region must not be empty."
  }
}

# Destination bucket configuration
variable "dst_bucket_name" {
  description = "The name of the destination S3 bucket."
  type        = string
  validation {
    condition     = length(var.dst_bucket_name) > 0
    error_message = "Destination bucket name must not be empty."
  }
}

variable "dst_bucket_arn" {
  description = "The ARN of the destination S3 bucket."
  type        = string
  validation {
    condition     = length(var.dst_bucket_arn) > 0
    error_message = "Destination bucket ARN must not be empty."
  }
}

variable "destination_region" {
  description = "The AWS region for the destination bucket."
  type        = string
  default     = "us-east-1"
  validation {
    condition     = length(var.destination_region) > 0
    error_message = "Destination region must not be empty."
  }
}

# IAM Role for replication
variable "role_arn" {
  description = "The ARN of the IAM role used for replication."
  type        = string
  validation {
    condition     = length(var.role_arn) > 0
    error_message = "Role ARN must not be empty."
  }
}

# Replication rule ID
variable "replication_rule_id" {
  description = "The ID of the replication rule."
  type        = string
  validation {
    condition     = length(var.replication_rule_id) > 0
    error_message = "Replication rule ID must not be empty."
  }
}
