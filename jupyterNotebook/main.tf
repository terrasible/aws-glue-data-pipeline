/**
 * Jupyter-Notebook
 */

provider "aws" {
  region                  = var.region
  shared_credentials_file = "/Users/tf_user/.aws/creds"
  profile                 = var.profile
}

resource "aws_sagemaker_notebook_instance" "Bio" {
  name          = var.name
  role_arn      = var.rolearn
  instance_type = var.instType

  tags = {
    Name        = var.name
    Environment = var.env
  }
}
