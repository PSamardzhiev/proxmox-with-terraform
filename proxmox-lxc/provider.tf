provider "proxmox" {
  endpoint = var.pm_target_endpoint
  username = var.pm_api_id
  password = var.pm_api_secret
  insecure = true
  ssh {
    agent    = true
    username = "tfm"
  }
}
