terraform {
  required_version = ">= 0.13.0"
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "~> 1.35.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

data "ibm_is_vpc" "vpc" {
    name = var.vpc_name
}

module "vpn_module" { 
  source = "../"

  resource_group_name   = var.resource_group_name
  region                = var.region
  sm_region             = var.sm_region
  ibmcloud_api_key      = var.ibmcloud_api_key
  name_prefix           = var.name_prefix
  resource_label        = var.resource_label
  secrets_manager_guid  = var.secrets_manager_guid
  vpc_id                = data.ibm_is_vpc.vpc.id
  subnet_ids            = data.ibm_is_vpc.vpc.subnets[*].id
}

resource local_file vpn_name {
  filename  = ".vpn_name"
  content   = module.vpn_module.name
}