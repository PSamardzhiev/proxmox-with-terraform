resource "proxmox_virtual_environment_container" "ubuntu_container" {
  description  = "LXC Container Managed by Terraform"
  node_name    = var.pm_datacenter_node
  vm_id        = var.pm_cnt_id
  unprivileged = var.cnt_root_flag
  features {
    nesting = true
  }
  initialization {
    hostname = var.cnt_hostname
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
    user_account {
      password = random_password.ubuntu_container_password.result
    }
    dns {
      domain = var.cnt_lookup_domain_config
      servers = var.cnt_dns_config
    }
  }
  network_interface {
    name    = var.pve_bridge_name
    enabled = true
  }

  disk {
    datastore_id = var.datastore_id
    size         = var.cnt_disk_size
  }

  operating_system {
    template_file_id = var.lxc_template_file_id
    type             = var.lxc_operatingsystem_type
  }
  memory {
    dedicated = var.cnt_memory_config
    swap      = var.cnt_swap_config
  }
  mount_point {
    acl    = true
    volume = "local-lvm"
    size   = var.cnt_bind_size
    path   = "/mnt/sda1/shared/"
  }

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }
}

resource "random_password" "ubuntu_container_password" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
  special          = true
}