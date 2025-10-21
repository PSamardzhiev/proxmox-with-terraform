# Proxmox LXC with Terraform

A small Terraform configuration to provision an Ubuntu LXC container on Proxmox VE.

## Repository layout
- main.tf — LXC resource, networking, disk, and initialization
- variables.tf — all configurable variables and defaults
- output.tf — outputs (including generated container password)
- provider.tf — provider configuration (if present)
- terraform.tfvars.example — example variables file (recommended)
- LICENSE — project license

## Prerequisites
- Terraform (install from https://www.terraform.io). Use the version compatible with the providers in this repo.
- Network access to Proxmox API.
- Proxmox API credentials (user@realm and secret/password).
- Optional: jq, curl for debugging.

## Quick start (macOS / Linux)
1. Create a local variables file:
   - Copy and edit an example:
     ```sh
     cp terraform.tfvars.example terraform.tfvars
     touch terraform.tfvars # this will create a required terraform.tfvars file
     open terraform.tfvars file with your favorite text editor and configure the below settings
     ```
   - Fill the file with the below:
   ```sh
     pm_target_endpoint = "https://proxmox-server-ip-or-dns-name:8006/api2/json"
     pm_api_id = "your-proxmox-user--example--terraform@pam"
     pm_api_secret = "your-username-or-api-secret"

2. Initialize:
   ```sh
   terraform init
   ```

3. Format & validate:
   ```sh
   terraform fmt
   terraform validate
   ```

4. Preview changes:
   ```sh
   terraform plan -out tfplan
   ```

5. Apply:
   ```sh
   terraform apply "tfplan"
   ```

6. Retrieve the generated container password (sensitive):
   ```sh
   terraform output -raw ubuntu_container_password
   ```

7. Cleanup:
   ```sh
   terraform destroy
   ```

## Example terraform.tfvars.example
```hcl
# filepath: terraform.tfvars.example
pm_target_endpoint = "https://PROXMOX_HOST:8006/api2/json"
pm_api_id          = "terraform@pam"
pm_api_secret      = "REPLACE_WITH_SECRET"

# Optional
# pm_cnt_id = 1001
# cnt_hostname = "my-lxc"
```

## Important variables (see variables.tf)
- pm_target_endpoint — Proxmox API endpoint
- pm_api_id / pm_api_secret — credentials used by the provider
- pm_cnt_id — numeric VMID for the container
- cnt_hostname — container hostname
- lxc_template_file_id — LXC template identifier
- datastore_id — Proxmox datastore (e.g. local-lvm)
- pve_bridge_name — network bridge/iface to attach container to

## Outputs
- ubuntu_container_password — randomly generated root password (sensitive). Use:
  ```sh
  terraform output -raw ubuntu_container_password
  ```
- Other user-facing messages are defined in output.tf.

## Security & best practices
- Do NOT commit terraform.tfvars or secrets to source control.
- Use environment variables, Vault, or token-based auth where possible.
- Keep .terraform.lock.hcl in source control to pin provider versions.
- Limit privileges of API credentials used by Terraform.

## Troubleshooting
- API connectivity: verify URL, port (8006), firewall rules, and that the account can access the necessary nodes.
- Authentication errors: check realm (pam, pve), and whether you're using a user/password vs API token.
- Check Terraform logs:
  ```sh
  TF_LOG=DEBUG terraform apply
  ```

## Extending
- Add cloud-init userdata or provisioners if you need post-boot configuration.
- Use modules for multiple containers or to parameterize networking/storage policies.

## License
See LICENSE in the repository.