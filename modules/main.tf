provider "aws" {
  region  = "us-east-1"
  profile = "example"
}

module "connections" {
  source                 = "../modules/glueConnection"
  profile                = "example"
  region                 = "us-east-1"
  name                   = "example-Connection"
  JDBC_CONNECTION_URL    = "jdbc:your_jdbc_url_here"
  PASSWORD               = "your_password_here"
  USERNAME               = "your_username_here"
  security_group_id_list = "sg-********"
  subnet_id              = "subnet-********"
  availability_zone      = "az1"
}

module "crawler" {
  source                = "../modules/glueCrawler"
  profile               = "example"
  region                = "us-east-1"
  nameSources           = ["source_crawler_name"]
  database_list_sources = ["source_db_name"]
  table_prefix_sources  = ["source_table_prefix"]
  pathSources           = ["source_path"]
  nameTarget            = ["target_crawler_name"]
  database_list_target  = ["target_db_name"]
  table_prefix_target   = ["target_table_prefix"]
  pathtarget            = ["target_path"]
  database              = ["database_name"]
  source_bucket         = "example-testing"
  target_bucket         = "example-2-target"
  env                   = "dev"
  crawlerRole           = "crawler-custom-role"
  policyName            = "crawler-custom-policy"
}

module "job" {
  source           = "../modules/glueJob"
  profile          = "example"
  region           = "us-east-1"
  rolearn          = module.crawler.roleArn
  env              = "dev"
  name             = ["example-job"]
  cmdName          = ["your_command_name"]
  filepath         = ["path_to_your_script"]
  vitals_schema    = ["vitals_schema_name"]
  sourceBucket     = "example-testing"
  targetBucket     = "example-testing"
  prefix           = ["example"]
  language         = ["python"]
  PythonVersion    = ["3"]
  GlueVersion      = "1.0"
  datefilter       = ["history"]
  username         = "example"
  password         = "example"
  connections      = [module.connections.connection_name]
  rdsname          = ["example_rds"]
  rdscmdName       = ["rds_command_name"]
  rdsfilepath      = ["path_to_rds_script"]
  rdsdatefilter    = ["any"]
  rdstable         = ["example_table"]
  rdsprefix        = ["example_prefix"]
  rdslanguage      = ["python"]
  rdsPythonVersion = ["3"]
  rdsurl           = "randomurl.rds.amazonaws.com"
}

module "trigger" {
  source   = "../modules/triggers"
  profile  = "example"
  region   = "us-east-1"
  jobname  = ["all"]
  schedule = ["cron(* * * * ? *)"]
}
