variable "region" {
  description = "Region for main"
  default = "us-central1"
}

variable "zone" {
  description = "zone for main"
  default = "us-central1-a"
}

variable "project" {
  description = "project for main"
  default = "inspired-bebop-278005"
}

variable "credentials" {
  description = "credentials for main"
  default = "/home/ahikar/Downloads/myprojnew.json"
}

variable "vpcname" {
  description = "vpcname for main"
  default = "terraform-network"
}

variable "vmname" {
  description = "vmname for main"
  default = "terraform-vm"
}

variable "fwname" {
  description = "fwname for main"
  default = "terraform-fw"
}