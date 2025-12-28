variable "pm_datacenter_node" {
  type        = string
  default     = "pve"
  description = "Datacenter Node Name"
}
variable "pm_target_endpoint" {
  type        = string
  description = "Proxmox API Endpoint"
}
variable "pm_api_id" {
  type        = string
  description = "Proxmox API User ID"
}
variable "pm_api_secret" {
  type        = string
  description = "Proxmox API User ID"
}
variable "pm_cnt_id" {
  type    = number
  default = 999
}
variable "cnt_root_flag" {
  type        = bool
  default     = true
  description = "Privileged Container Flag"
}
variable "cnt_hostname" {
  type        = string
  default     = "tfm-ubuntu-lxc"
  description = "Container Hostname"
}
variable "cnt_memory_config" {
  type        = number
  default     = 512
  description = "Container memory size"
}
variable "cnt_swap_config" {
  type        = number
  default     = 256
  description = "Container swap size"
}
variable "cnt_bind_size" {
  type        = string
  default     = "25G"
  description = "Container Disk Size"

}
variable "cnt_disk_size" {
  type        = number
  default     = 25
  description = "Container Disk Size"
}

variable "lxc_template_file_id" {
  type        = string
  default     = "D2-LAB:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
  description = "The identifier for an OS template file"
}
variable "lxc_operatingsystem_type" {
  type    = string
  default = "ubuntu"
}
variable "datastore_id" {
  type = string
  default = "local-lvm"
}
variable "cnt_dns_config" {
  type = list(string)
  default = [
    "192.168.1.4",
    "1.1.1.1"
  ]
}

variable "cnt_lookup_domain_config" {
  type = string
  default = "pve.vlab.local"
  
}

variable "pve_bridge_name" {
  type = string
  default = "eth0"
}