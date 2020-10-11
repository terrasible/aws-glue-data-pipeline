variable "profile" {
  description = "Name the profile for setting up crawler"
  default     = "cc-sandbox"
}

variable "region" {
  description = "Name the region for setting up crawler"
  default     = "ap-southeast-1"
}

variable "name" {
  description = "Name the name"
  default     = ""
}

variable "JDBC_CONNECTION_URL" {
  description = "Name the JDBC_CONNECTION_URL"
  default     = ""
}

variable "PASSWORD" {
  description = "Name the PASSWORD"
  default     = ""
}

variable "USERNAME" {
  description = "Name the USERNAME"
  default     = ""
}

variable "availability_zone" {
  description = "Name the availability_zone"
  default     = ""
}

variable "security_group_id_list" {
  description = "Name the security_group_id_list"
  default     = ""
}

variable "subnet_id" {
  description = "Name the subnet_id"
  default     = ""
}
