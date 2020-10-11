# General Modules Of AWS Resources used in data lake 

This repository contain the genralise template for spinning up aws data lake resources.

## Examples

```
module "connections" {
  source                = "../modules/glueConnection"
  profile               = "example"
  region                = "us-east-1"
  name                  = "example-Connection"
  JDBC_CONNECTION_URL   = "jdbc:******************"
  PASSWORD              = "example"
  USERNAME              = "example"
  security_group_id_list = "sg-*****"
  subnet_id              = "subnet-********"
  availability_zone      = "az1"
}
```
```
module "Crawler" {
  source        = "../modules/glueCrowler"
  profile       = "example"
  region        = "us-east-1"
  nameSources   = [""]
  database_list_sources = [""]
  table_prefix_sources = [""]
  pathSources = [""]
  nameTarget = [""]
  database_list_target = [""]
  table_prefix_target = [""]
  pathtarget = ["]
  database = ["]
  source_bucket = "example-testing"
  target_bucket = "example-2-target"
  env           = "dev"
  crawlerRole   = "crawler-custom-role"
  policyName    = "crawler-custom-policy"
}
```
```
module "Job" {
  source        = "../modules/glueJob"
  profile       = "example"
  region        = "us-east-1"
  rolearn       = "${module.Crawler.roleArn}"
  env           = "dev"
  name          = [""]
  cmdName       = ["""]
  filepath      = ["""]
  vitals_schema = [""]
  sourceBucket  = "example-testing"
  targetBucket  = "example-testing"
  prefix        = ["example"]
  language      = ["python"]
  PythonVersion = ["3"]
  GlueVersion   = "1.0"
  datefilter    = ["history"]
  username      = "example"
  password      = "example"
  connections   = ["${module.connections.name}"]
  rdsname       = [""]
  rdscmdName    = [""]
  rdsfilepath   = [""]
  rdsdatefilter = ["any"]
  rdstable      = ["example"]
  rdsprefix     = ["example"]
  rdslanguage   = ["python"]
  rdsPythonVersion = ["3"]
  rdsurl        = "randomurl.rds.amazonaws.com"
}
```
```
module "trigger" {
  source   = "../modules/triggers"
  profile  = "example"
  region   = "us-east-1"
  jobname  = ["all"]
  schedule = ["cron(* * * * ? *)"]
}
```

### Author

This is maintened by Bibek Roniyar

### License 

MIT License

Copyright (c) [2020] [Bibek Roniyar]

See LICENSE for full details.

