variable "buildSuffix" {
  type        = string
  default     = null
  description = "random build suffix for resources"
}
variable "projectPrefix" {
  type        = string
  description = "projectPrefix name for tagging"
}

variable "azureRegion1" {
  type        = string
  description = "target azure region"
}

variable "ssh_public_key" {}

variable "servicesVnetAddressSpace" {
  default = "100.64.16.0/20"
}

variable "servicesVnetExternalSubnet" {
  default = "100.64.16.0/24"
}

variable "servicesVnetInternalSubnet" {
  default = "100.64.17.0/24"
}

variable "servicesVnetWorkloadSubnet" {
  default = "100.64.18.0/24"
}

variable "spokeVnetAddressSpace" {
  default = "10.2.0.0/20"
}

variable "spokeVnetExternalSubnet" {
  default = "10.2.0.0/24"
}

variable "spokeVnetInternalSubnet" {
  default = "10.2.1.0/24"
}

variable "spokeVnetWorkloadSubnet" {
  default = "10.2.2.0/24"
}
