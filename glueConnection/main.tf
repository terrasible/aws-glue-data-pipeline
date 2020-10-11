provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_glue_connection" "connection" {
  connection_properties = {
    JDBC_CONNECTION_URL = var.JDBC_CONNECTION_URL
    PASSWORD            = var.PASSWORD
    USERNAME            = var.USERNAME
  }

  name = var.name

  physical_connection_requirements {
    availability_zone      = var.availability_zone
    security_group_id_list = [var.security_group_id_list]
    subnet_id              = var.subnet_id
  }
}
