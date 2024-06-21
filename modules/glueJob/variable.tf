variable "profile" {
  description = "Name the profile for setting up GuleJob"
  default     = "cc-sandbox"
}

variable "region" {
  description = "Name the region for setting up GuleJob"
  default     = "ap-south-1"
}

variable "name" {
  description = "Name the Gule-Job"
  type        = list(string)
  default     = ["acc_parser", "acc_wrapper", "ecg_signals_parser", "ecg_signals_wrapper", "ipi_everion_parser", "ipi_everion_wrapper", "ppg_everion_parser", "ppg_everion_wrapper", "rds_episodic_data_parser", "rds_episodic_data_wrapper", "vitals_e4_parser", "vitals_e4_wrapper", "vitals_everion_parser", "vitals_everion_wrapper", "vitals_ihealth_parser", "vitals_ihealth_wrapper", "vitals_vitalpatch_parser", "vitals_vitalpatch_wrapper"]
}

variable "cmdName" {
  description = "Name the Gule-Job"
  type        = list(string)
  default     = ["glueetl", "pythonshell", "glueetl", "pythonshell", "glueetl", "pythonshell", "glueetl", "pythonshell", "glueetl", "glueetl", "glueetl", "pythonshell", "glueetl", "pythonshell", "glueetl", "pythonshell", "glueetl", "pythonshell"]
}

variable "rolearn" {
  description = "Name the Gule-Job arn"
  default     = "arn:aws:iam::626505363333:role/glue-role-custom-job"
}

variable "env" {
  description = "Name the Gule-Job Environment"
  default     = "dev"
}

variable "filepath" {
  description = "python file path for dlue job"
  type        = list(string)
  default     = ["glue_job_scripts/acc_parser", "glue_job_scripts/acc_wrapper.py", "glue_job_scripts/ecg_signals_parser", "glue_job_scripts/ecg_signals_wrapper.py", "admin/ipi_everion_parser", "glue_job_scripts/ipi_everion_wrapper.py", "glue_job_scripts/ppg_everion_parser", "glue_job_scripts/ppg_everion_wrapper.py", "admin/rds_episodic_data_parser", "glue_job_scripts/rds_episodic_data_wrapper", "glue_job_scripts/vitals_e4_parser", "glue_job_scripts/vitals_e4_wrapper.py", "glue_job_scripts/vitals_everion_parser", "glue_job_scripts/vitals_everion_wrapper.py", "glue_job_scripts/vitals_ihealth_parser", "glue_job_scripts/vitals_ihealth_wrapper.py", "glue_job_scripts/vitals_vitalpatch_parser", "glue_job_scripts/vitals_vitalpatch_wrapper.py"]
}


variable "sourceBucket" {
  description = "Target Bucket"
  default     = "gunj-mum-glue-job-scripts"
}

variable "targetBucket" {
  description = "Target Bucket"
  default     = "gunj-mum-glue-job-target"
}

variable "prefix" {
  description = "Target prefix"
  type        = list(string)
  default     = ["acc", "acc", "ecg/signals", "ecg/signals", "ipi", "ipi", "ppg", "ppg", "null", "episodic_data", "vitals", "vitals", "vitals", "vitals", "vitals", "vitals", "vitals", "vitals"]
}

variable "language" {
  description = "Job Language"
  type        = list(string)
  default     = ["python", "python", "python", "null", "python", "null", "python", "null", "python", "python", "python", "python", "python", "python", "python", "null", "python", "null"]
}

variable "PythonVersion" {
  description = "PythonVersion"
  type        = list(string)
  default     = ["3", "3", "2", "3", "3", "3", "2", "3", "3", "3", "2", "3", "3", "3", "2", "3", "3", "3"]
}

variable "datefilter" {
  description = "Job datefilter"
  type        = list(string)
  default     = ["20200220", "history", "history", "history", "history", "20191019", "history", "history", "history", "history", "15081947", "20191227", "history", "history", "history", "history", "history"]
}

variable "vitals_schema" {
  description = "Job vitals_schema"
  type        = list(string)
  default     = ["", "", "", "", "", "", "", "", "", "counter, timestamp, spo2, spo2_quality, hr, hr_quality, blood_perf, cls, cls_quality, act, sps, bpw, hrv, hrv_quality, rr, rr_quality, eps, eps_quality, temp, o_temp, b_temp, baro, gsr_ampl, gsr_phase", "counter, timestamp, spo2, spo2_quality, hr, hr_quality, blood_perf, cls, cls_quality, act, sps, bpw, hrv, hrv_quality, rr, rr_quality, eps, eps_quality, temp, o_temp, b_temp, baro, gsr_ampl, gsr_phase", "", "", ""]
}

variable "type_mapping" {
  description = "Job type_mapping"
  type        = list(string)
  default     = ["", "", "", "", "", "", "", "", "1#IBI,2#HR,3#BVP,4#GSR,5#TEMP", "1#IBI,2#HR,3#BVP,4#GSR,5#TEMP", "", "", "", ""]
}

variable "password" {
  description = "Target password"
  default     = "admin"
}

variable "rdstable" {
  description = "Target table"
  type        = list(string)
  default     = ["episodic_data", "episodic_data"]
}

variable "username" {
  description = "Target username"
  default     = "admin"
}

variable "connections" {
  description = "Name the connection for Gule-Job"
  type        = list(string)
  default     = ["rds-mysql-biofourmis"]
}

variable "rdsname" {
  description = "Name the Gule-rds-Job"
  type        = list(string)
  default     = ["rds_episodic_data_parser", "rds_episodic_data_wrapper"]
}

variable "rdscmdName" {
  description = "Name the Gule-Job"
  type        = list(string)
  default     = ["glueetl", "pythonshell"]
}

variable "rdsprefix" {
  description = "Target prefix"
  type        = list(string)
  default     = ["", "episodic_data"]
}

variable "rdslanguage" {
  description = "Job Language"
  type        = list(string)
  default     = ["python", "python"]
}

variable "rdsPythonVersion" {
  description = "PythonVersion"
  type        = list(string)
  default     = ["3", "3"]
}

variable "rdsdatefilter" {
  description = "Job datefilter"
  type        = list(string)
  default     = ["history", "history"]
}

variable "rdsfilepath" {
  description = "Job rdsfilepath"
  type        = list(string)
  default     = ["admin/rds_episodic_data_parser", "glue_job_scripts/rds_episodic_data_wrapper"]
}

variable "rdsurl" {
  description = "Target url"
  default     = "biofourmis-rds-episodic.cnyggffrlz0q.ap-southeast-1.rds.amazonaws.com"
}

variable "GlueVersion" {
  description = "Glue GlueVersion"
  default     = "1.0"
}
