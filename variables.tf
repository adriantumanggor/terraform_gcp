variable "region" {
  description = "The GCP region where resources will be created"
  type        = string
  default     = "<filled in at lab start>"
}

variable "zone" {
  description = "The GCP zone within the region where resources will be created"
  type        = string
  default     = "<filled in at lab start>"
}

variable "project_id" {
  description = "The Google Cloud Project ID"
  type        = string
  default     = "<filled in at lab start>"
}