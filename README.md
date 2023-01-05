# Provision an EC2 instance in AWS

This Terraform configuration provisions an EC2 instance in AWS using Terraform.

## Details

By default, this configuration provisions the latest Ubuntu 18.04 AMI with type t2.micro in the us-west-1 region. The AMI Owner, AMi Search Name, region, and type can all be set as variables. You can also set the name variable to determine the value set for the Name tag.
