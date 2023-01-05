# VARIABLES

variable "name_prefix" {
  description = "Name prefix to use when naming resources."
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default     = "t3.micro" # default
}

variable "ssh_cidr" {
  description = "IP CIDR to allow inbound on port 22."
  default     = "10.0.0.1/32"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "ami_owner" {
  description = "Owner of AMI to provision."
  default     = "099720109477"
}

variable "ami_search_name" {
  description = "Search name of AMI to provision."
  default     = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
}

