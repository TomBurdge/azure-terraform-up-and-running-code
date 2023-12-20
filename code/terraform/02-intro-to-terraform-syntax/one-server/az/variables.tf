# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  type = string
  default= "one-server"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type = string
  default= "uksouth"
}

variable "username" {
 type = string
}
variable "password" {
 type = string
}