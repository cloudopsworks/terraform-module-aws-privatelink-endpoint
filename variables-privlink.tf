##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

variable "name_prefix" {
  description = "Prefix for the name of the private link"
  type        = string
}

variable "vpc" {
  description = "VPC object to use for the private link"
  type        = any
  default     = {}
}

variable "private_link_id" {
  description = "Private link ID to use for the private link"
  type        = string
}

variable "settings" {
  description = "Settings for the private link"
  type        = any
  default     = {}
}