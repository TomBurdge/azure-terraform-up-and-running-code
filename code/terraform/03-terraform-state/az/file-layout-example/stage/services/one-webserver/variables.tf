##############################################################################
# Variables File
#
# Here is where we store the default values for all the variables used in our
# Terraform code.

variable "db_remote_state_container"{
  description = "The name of the Azure Storage Container used for the database's remote state storage"
  type = string
}

variable "db_remote_state_key"{
  description = "The name of the Azure Storage key used for the database's remote state storage"
  type = string
}

variable "prefix" {
  description = "This prefix will be included in the name of some resources."
  default     = "apachetfazuprunning"
}

variable "resource_group_name" {
  description = "The name of your Azure Resource Group."
  default     = "Apache-Terraform-az-up-running"
}

variable "location" {
  description = "The region where the virtual network is created."
  default     = "uksouth"
}

variable "virtual_network_name" {
  description = "The name for your virtual network."
  default     = "vnet"
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = ["10.0.2.0/24"]
}

variable "hostname" {
  description = "Virtual machine hostname. Used for local hostname, DNS, and storage-related names."
  default     = "vmtf"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_D2s_v3"
}

variable "image_publisher" {
  description = "Name of the publisher of the image (az vm image list)"
  default     = "Canonical"
}

variable "image_offer" {
  description = "Name of the offer (az vm image list)"
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "Image SKU to apply (az vm image list)"
  default     = "22_04-lts-gen2"
}

variable "image_version" {
  description = "Version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "admin_username" {
  description = "Administrator user name"
  default     = "adminuser"
}

variable "admin_password" {
  description = "Administrator password"
  default     = "AdminPa55w.rd123!"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}