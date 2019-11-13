variable "certificate" {
  type        = "string"
  description = "Path to Certificate file or GCP certificate link"
  default     = ""
}

variable "credentials_file" {
  type        = "string"
  description = "Path to credential file"
}

variable "domain" {
  type        = "string"
  description = "domain name"
}

variable "dns_zone" {
  type        = "string"
  description = "Managed DNS Zone name"
}

variable "frontend_dns" {
  type        = "string"
  description = "DNS name for load balancer"
}

variable "license_file" {
  type        = "string"
  description = "License file"
}

variable "project" {
  type        = "string"
  description = "Name of the project to deploy into"
}

variable "region" {
  default = "us-central1"
}

variable "public_ip" {
  type        = "string"
  description = "the public IP for the load balancer to use"
  default     = ""
}

variable "ssl_policy" {
  type        = "string"
  description = "SSL policy for the cert"
  default     = ""
}

variable "subnet" {
  type        = "string"
  description = "name of the subnet to install into"
  default     = ""
}

variable "primary_count" {
  type        = "string"
  description = "Number of primary nodes to run, must be odd number - 3 or 5 recommended."
  default     = "3"
}

variable "secondary_count" {
  type        = "string"
  description = "Number of secondary nodes to run"
  default     = "0"
}

variable "postgresql_machinetype" {
  type = "string"
  description = "Machine type to use for Postgres Database"
  default = ""
}

variable "postgresql_dbname" {
  type = "string"
  description = "Name of Postgres Database"
}

variable "postgresql_password" {
  type        = "string"
  description = "Password for Postgres Database"
}

