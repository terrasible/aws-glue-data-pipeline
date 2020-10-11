/**
 * GLUE-JOB
 */

provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_glue_job" "bio-glue" {
  count       = length(var.name) > 0 ? length(var.name) : 0
  name        = var.name[count.index]
  role_arn    = var.rolearn
  glue_version = var.GlueVersion



  command {
    name            = "${var.cmdName[count.index]}"
    script_location = "s3://${var.sourceBucket}/${var.filepath[count.index]}"
    python_version   = "${var.PythonVersion[count.index]}"
  }

  default_arguments = {
    "--date_filter"      = "${var.datefilter[count.index]}"
    "--S3_TARGET_BUCKET" = "${var.targetBucket}"
    "--S3_TARGET_PREFIX" = "${var.prefix[count.index]}"
    "--vitals_schema"    = "${var.vitals_schema[count.index]}"
    "--type_mapping"     = "${var.type_mapping[count.index]}"
    "--TempDir"          = "s3://${var.sourceBucket}/Temp"
    "--job-language"     = "${var.language[count.index]}"
    "--LABLE"            = "lable_2"
  }

  tags = {
    Name        = var.name[count.index]
    Environment = var.env
  }
}

resource "aws_glue_job" "bio-rds-glue" {
  count       = length(var.rdsname) > 0 ? length(var.rdsname) : 0
  name        = var.rdsname[count.index]
  role_arn    = var.rolearn
  glue_version = var.GlueVersion
  connections = var.connections

  command {
    name            = "${var.rdscmdName[count.index]}"
    script_location = "s3://${var.sourceBucket}/${var.rdsfilepath[count.index]}"
    python_version   = "${var.rdsPythonVersion[count.index]}"
  }

  default_arguments = {
    "--DATE_FILTER"      = "${var.rdsdatefilter[count.index]}"
    "--S3_TARGET_BUCKET" = "${var.targetBucket}"
    "--S3_TARGET_PREFIX" = "${var.rdsprefix[count.index]}"
    "--DB"               = "derivatives"
    "--PASSWORD"         = "${var.password}"
    "--TABLE"            = "${var.rdstable[count.index]}"
    "--TempDir"          = "s3://${var.sourceBucket}/Temp"
    "--USER"             = "${var.username}"
    "--job-language"     = "${var.rdslanguage[count.index]}"
    "--URL"              = "${var.rdsurl}"
    "--JOB_NAME"         = "rds-etl-job"
    "--LABLE"            = "lable_2"
  }

  tags = {
    Name        = var.name[count.index]
    Environment = var.env
  }
}
