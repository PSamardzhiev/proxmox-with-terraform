output "ubuntu_container_password" {
  value     = random_password.ubuntu_container_password.result
  sensitive = true
}
output "password_warning" {
  value = "you can use terraform output -raw ubuntu_container_password to view your password!"
  sensitive = false
}
output "password_change_notification" {
  value = "Please change the password after the first login"  
  sensitive = false
}
output "container_username" {
  value = "You can use root as your username for login "  
}