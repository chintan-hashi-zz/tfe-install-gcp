This Repo can be used to deploy Terraform Enterprise (v5) into your GCP environment in Production Mode. This will first create a VPC, Subnet, GCS Bucket, Postgres Database, Firewalls, and SSL Certificate in your GCP ennvironment before deploying the Application. 

## Modules Used

- [Official TFE GCP Module](https://github.com/hashicorp/terraform-google-terraform-enterprise)
- [Customized GCP Bootstrap Module](https://github.com/cneralich/private-terraform-enterprise/tree/master/examples/bootstrap-google) 

## Pre-Requisites

The following items must be configured prior to using this Module:

- A GCP Project
- Valid GCP Credentials stored in JSON format
- A valid DNS Zone
- A valid Domain
- Enable the servicenetworking.googleapis.com API in your GCP Project
- Enable the cloudresourcemanager.googleapis.com API in your GCP Project

## Required Variables

- `credentials_file` -- Path to credential file
- `domain` -- Domain name
- `dns_zone` -- Managed DNS Zone name
- `frontend_dns` -- DNS name for load balancer
- `license_file` -- License file
- `project` -- GCP Project Name
- `postgresql_dbname` -- Name of Postgres Database
- `postgresql_password` -- Password for Postgres Database

## Optional Variables

- `certificate` -- Path to Certificate file or GCP Certificate link
- `region` -- GCP Region
- `public_ip` -- The public IP for the load balancer to use
- `ssl_policy` -- SSL policy for the Certificate
- `subnet` -- Name of the Subnet
- `primary_count` -- Number of primary nodes to run, must be odd number - 3 or 5 recommended
- `secondary_count` -- Number of secondary nodes to run
- `postgresql_machinetype` -- Machine type to use for Postgres Database


## How to Use this Repo

- Update the values in the terraform.tfvars file 
- Run `terraform plan` and `terraform apply`
