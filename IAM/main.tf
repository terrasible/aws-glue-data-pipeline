/**
 * IAM Groups and access Level
 */

provider "aws" {
  region  = var.region
  profile = var.profile
}

/**
 *  Creating Required Groups
 */

resource "aws_iam_group" "Groups" {
  count = length(var.groups)
  name  = var.groups[count.index]
}

/**
 * Creating Required Policies
 */

resource "aws_iam_policy" "devadmin" {
  name        = var.devadmin
  description = "full-access"
  policy      = file("../../modules/IAM/devadminstrator.json")
}


resource "aws_iam_policy" "deviamronly" {
  name        = var.deviamronly
  description = "full-access-with IAM-ReadOnly"
  policy      = file("../../modules/IAM/adminIAMreadonly.json")
}

resource "aws_iam_policy" "psadmin" {
  name        = var.psadmin
  description = "Read-Write-access-over-glue-athena-s3-sagemaker"
  policy      = file("../../modules/IAM/psadministrator.json")
}

resource "aws_iam_policy" "psiamronly" {
  name        = var.psiamronly
  description = "Read-Write-access-over-glue-athena-s3-sagemaker"
  policy      = file("../../modules/IAM/psIAMreadonly.json")
}

/**
 * DEV
 */

resource "aws_iam_group_policy_attachment" "attach-dev-admin" {
  count      = length(var.groups) > 0 && var.env == "dev" ? 2 : 0
  group      = var.groups[count.index]
  policy_arn = aws_iam_policy.devadmin.arn
}


resource "aws_iam_group_policy_attachment" "attach-dev-iamRO" {
  count      = length(var.groups) > 0 && var.env == "dev" ? 3 : 0
  group      = var.groups[count.index + 2]
  policy_arn = aws_iam_policy.deviamronly.arn
}

