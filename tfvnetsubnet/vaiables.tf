variable "rg_Name" {
    type = string
    description = "Specify name of resource group"  
}

variable "location" {
    type = string
    description = "Specify location for resources"  
}

variable "vnet1" {
    type = string
    description = "Specify vnet name"
}

variable "address_space" {
    type = list(any)
    description = "Specify address space for virtual network"
}
variable "subnet1" {
    type = string
    description = "Specify name for subnet"
  
}
variable "address_prefix" {
    type = list(any)
    description = "Specify address prefix for subnet" 
}

variable "stg_Name" {
    type = string
    description = "Specify storage acc name" 
}

variable "acc_tier" {
    type = string
  
}
variable "acc_kind" {
  type = string
}
variable "access_tier" {
  type = string
}
