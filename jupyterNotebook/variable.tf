variable "profile" {
  description = "Name the profile for setting up Notebook instance"
  default     = "cc-sandbox"
}

variable "region" {
  description = "Name the region for setting up Notebook instance"
  default     = "ap-southeast-1"
}

variable "name" {
  description = "Name the NoteBook-Jupyter"
  default     = "test-jupyter-bio"
}

variable "rolearn" {
  description = "Role for NoteBook-Jupyter"
  default     = "arn:aws:iam::626505363333:role/Sagemaker-full-access"
}

variable "instType" {
  description = "instance type for NoteBook-Jupyter"
  default     = "ml.t2.medium"
}

variable "env" {
  description = "Name the JupyterNotbook Environment"
  default     = "dev"
}
