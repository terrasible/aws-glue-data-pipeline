/**
 * Set S3 Replication
 */

provider "aws" {
  region  = var.src_region
  profile = var.profile
}

provider "aws" {
  alias   = "destination"
  region  = var.dst_region
  profile = var.profile
}

resource "aws_s3_bucket" "dst_bucket" {
  provider = aws.destination
  bucket   = var.dst_bucket_name
  region   = var.dst_region

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "src_bucket" {
  bucket = var.src_bucket_name
  region = var.src_region

  versioning {
    enabled = true
  }

  replication_configuration {
    role = var.role_arn

    rules {
      id     = var.id
      status = "Enabled"

      destination {
        bucket        = var.dst_bucket_arn
        storage_class = "STANDARD"
      }
    }
  }
}
