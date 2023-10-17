variable "application_name" {
  type = string
}

variable "k8s_version" {
  type = string
}

variable "availability_zones" {
  type = list(number)
}

variable "node_size" {
  type = string
}

variable "linux_node_size" {
  type = string
}

variable "windows_node_size" {
  type = string
}

variable "os_disk_size" {
  type = number
}

variable "region" {
  description = "NA26 or NA27 etc..."
  type        = string
}

variable "resource_group_name" {
  description = "the Resource Group to create the service in"
  type        = string
}

variable "container_registry_name" {
  type = string
}

variable "container_registry_group" {
  type = string
}

variable "service_principal_name" {
  description = "The service principal that owns the resource group"
  type        = string
}

variable "principal_access_ids" {
  type = map(string)
}

variable "storage_account_name" {
  description = "the storage account associated with this resource group"
  type        = string
}

variable "tags" {}


variable "gateway_private_ip" {
  type = string
}

variable "vnet_CIDR" {
  description = "An array of CIDR strings"
}

variable "subnet_mgmt_CIDR" {
  type = string
}

variable "subnet_lin_CIDR" {
  type = string
}

variable "subnet_win_CIDR" {
  type = string
}

variable "mgmt_pool_count" {
  type = number
}

variable "mgmt_max_pool_count" {
  type = number
}

variable "linux_pool_count" {
  type = number
}

variable "linux_max_pool_count" {
  type = number
}

variable "windows_pool_count" {
  type = number
}

variable "windows_max_pool_count" {
  type = number
}

variable "admin_groups" {}

variable "paired_vnet_name" {
  type = string
}

variable "paired_resource_group" {
  type = string
}

variable "paired_mgmt_subnet_name" {
  type = string
}

# variable "paired_win_subnet_name" {
#   type = string
# }

variable "paired_linux_subnet_name" {
  type = string
}
