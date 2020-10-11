/**
 * CRAWLER
 */

provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_iam_role" "role" {
  name = var.crawlerRole

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    Name        = var.crawlerRole
    Environment = var.env
  }
}

resource "aws_iam_policy" "full_access" {
  name        = var.policyName
  description = "full-access over s3 athena crawler glue rds"
  policy      = file("../modules/glueCrowler/policy.json")
}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.full_access.arn
}

resource "aws_glue_catalog_database" "glue_database" {
  count = length(var.database) > 0 ? length(var.database) : 0
  name  = var.database[count.index]
}

/**
 * Sources
 */

resource "aws_glue_crawler" "crawler_sources" {
  count         = length(var.nameSources) > 0 ? length(var.nameSources) : 0
  database_name = var.database_list_sources[count.index]
  name          = var.nameSources[count.index]
  role          = aws_iam_role.role.arn
  table_prefix  = var.table_prefix_sources[count.index]

  s3_target {
    path = "s3://${var.source_bucket}/${var.pathSources[count.index]}"
  }

  tags = {
    Name        = var.nameSources[count.index]
    Environment = var.env
  }
}

/**
 * Target
 */

resource "aws_glue_crawler" "crawler_targets" {
  count         = length(var.nameTarget) > 0 ? length(var.nameTarget) : 0
  database_name = var.database_list_target[count.index]
  name          = var.nameTarget[count.index]
  role          = aws_iam_role.role.arn
  table_prefix  = var.table_prefix_target[count.index]

  s3_target {
    path = "s3://${var.target_bucket}/${var.pathtarget[count.index]}"
  }

  tags = {
    Name        = var.nameTarget[count.index]
    Environment = var.env
  }
}
