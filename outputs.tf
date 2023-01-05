# OUTPUTS

# DISPLAY PUBLIC DNS ADDRESS
output "public_dns" {
  description = "Instance DNS Address"
  value       = aws_instance.aws_vm.public_dns
}
