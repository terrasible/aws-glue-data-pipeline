# AWS Glue Data Pipeline Infrastructure

This project provides Terraform modules to automate the deployment of core components for your AWS Glue data pipelines. These modules facilitate the creation of:

* **Glue Connections:** Define database connections for Glue crawlers and jobs to access data sources.
* **Glue Crawlers:** Automatically discover and define schema for your data in various data stores.
* **Glue Jobs:** Execute ETL (Extract, Transform, Load) processes on your data using scripts.
* **Glue Triggers:** Schedule Glue jobs to run on a regular basis.

**Benefits:**

* **Standardized Infrastructure:** Ensure consistent configurations across your data pipelines.
* **Reusable Modules:** Promote code reuse and maintainability.
* **Infrastructure as Code:** Manage pipeline infrastructure alongside your code for version control and easier deployment.

**Getting Started**

1. **Prerequisites:**
   - An AWS account with appropriate permissions.
   - Terraform installed and configured with AWS provider credentials.

2. **Configure Variables:**

   Update the `variables.tf` file within each module directory (`modules/glueConnection`, `modules/glueCrawler`, `modules/glueJob`, `modules/triggers`) with your specific values:

   - `JDBC_CONNECTION_URL`, `USERNAME`, `PASSWORD`, etc. for connections
   - `nameSources`, `database_list_sources`, etc. for crawlers
   - `rolearn`, `cmdName`, `filepath`, etc. for jobs
   - `jobname`, `schedule` for triggers (optional)

4. **Initialize Terraform:**

   ```bash
   cd <project_root>
   terraform init
   ```

5. **Apply Configuration:**

   ```bash
   terraform apply
   ```

**Module Structure:**

```
├── CODEOWNERS
├── LICENSE
├── README.md
├── modules
│   ├── IAM
│   │   ├── adminIAMreadonly.json
│   │   ├── devadminstrator.json
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── psIAMreadonly.json
│   │   ├── psadministrator.json
│   │   └── variable.tf
│   ├── glueConnection
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── providers.tf
│   │   └── variable.tf
│   ├── glueCrawler
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── policy.json
│   │   └── variable.tf
│   ├── glueJob
│   │   ├── main.tf
│   │   └── variable.tf
│   ├── jupyterNotebook
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   └── variable.tf
│   ├── main.tf
│   ├── s3Replication
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   └── variable.tf
│   └── triggers
│       ├── main.tf
│       └── variable.tf
├── outputs.tf
└── release-please-config.json
```

## Usage Examples

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

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
