# proxmox-with-terraform
This repo provides sample of deploying a ubuntu lxc container and virtual machine on proxmox with terraform.\
The chosen provider is "bpg/proxmox"\
When you clone the repo, you need to create a file nammed ```terraform.tfvars``` with the following variables:\

```bash
pm_target_endpoint = "https://IP-ADDRESS-OF-YOUR-PROXMOX-SERVER/api2/json"
pm_api_id          = "username@realm"
pm_api_secret      = "password"
```

Reference URL for detailed provider information:

```html
https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_container
```
Notes:\
The created container will have a default username: ```root```\
The password can be viewed by using the command ```terraform output -raw ubuntu_container_password```
