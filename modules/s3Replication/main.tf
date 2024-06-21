/**
 * Set S3 Replication
 */


# Resource for destination S3 bucket
resource "aws_s3_bucket" "dst_bucket" {
  provider = aws.destination
  bucket   = var.dst_bucket_name
}

# Enable versioning on the destination S3 bucket
resource "aws_s3_bucket_versioning" "dst_bucket_versioning" {
  bucket = aws_s3_bucket.dst_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Resource for source S3 bucket
resource "aws_s3_bucket" "src_bucket" {
  provider = aws.source
  bucket   = var.src_bucket_name
}

# Enable versioning on the source S3 bucket
resource "aws_s3_bucket_versioning" "src_bucket_versioning" {
  bucket = aws_s3_bucket.src_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# S3 bucket replication configuration
resource "aws_s3_bucket_replication_configuration" "replication" {
  depends_on = [aws_s3_bucket_versioning.src_bucket_versioning]

  role   = var.role_arn
  bucket = aws_s3_bucket.src_bucket.id

  rule {
    id     = var.replication_rule_id
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.dst_bucket.arn
      storage_class = "STANDARD"
    }
  }
}
