
provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_glue_trigger" "triggers" {
  count    = length(var.jobname) > 0 ? length(var.jobname) : 0
  name     = var.jobname[count.index]
  type     = "SCHEDULED"
  schedule = var.schedule[count.index]

  actions {
    job_name = var.jobname[count.index]
  }
}
