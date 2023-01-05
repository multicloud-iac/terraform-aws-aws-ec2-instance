terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46.0"
    }
  }
  required_version = ">= 0.13"
}

# INITIALIZE AWS PROVIDER
provider "aws" {
  region = "us-west-2"
}

# CREATE AWS INSTANCE
resource "aws_instance" "aws_vm" {
  ami                    = data.aws_ami.most_recent_ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = merge({ "Name" = "${var.name_prefix}-instance", "Project" = var.name_prefix }, var.tags)
}

# FIND MOST RECENT IMAGE
data "aws_ami" "most_recent_ami" {
  filter {
    name   = "name"
    values = [var.ami_search_name]
  }

  most_recent = true

  owners = [var.ami_owner]
}

# CREATE NETWORK SECURITY GROUP ALLOWING SSH
resource "aws_security_group" "ssh" {
  name        = "${var.name_prefix}-ssh-sg"
  description = "${var.name_prefix} Test SG"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge({ "Name" = "${var.name_prefix}-ssh-sg", "Project" = var.name_prefix }, var.tags)
}
