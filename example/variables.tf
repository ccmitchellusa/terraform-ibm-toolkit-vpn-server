# Resource Group Variables
variable "resource_group_name" {
  type        = string
  description = "Existing resource group where the VPN Server will be provisioned"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The api key for IBM Cloud access"
}

variable "region" {
  type        = string
  description = "The IBM Cloud region where the resources will be provisioned"
}

variable "sm_region" {
  type        = string
  description = "Region for the Secrets Manager instance for storing VPN server certificates"
}

variable "secrets_manager_guid" {
  type        = string
  description = "Unique id for an existing Secrets Manager instance"
}

variable "name_prefix" {
  type        = string
  description = "Prefix name that should be used for the cluster and services. If not provided then resource_group_name will be used"
  default     = "example"
}

variable "resource_label" {
  type        = string
  description = "Label to append to created resources"
}

# VPC Variables
variable "vpc_name" {
  type        = string
  description = "The name of the vpc instance"
}
