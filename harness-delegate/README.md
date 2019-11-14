# Terraform Harness.io delegate Module

This module handles a hareness.io Delegate to be created gcp
The resources/services/activations/deletions that this module will create/trigger are:
- Google Compute Node
    - With Docker instaleld
    - Running Delegate Container

## Compatibility

This module is meant for use with Terraform 0.12. If you haven't
[upgraded][terraform-0.12-upgrade] and need a Terraform
0.11.x-compatible version of this module, the last released version
intended for Terraform 0.11.x is [3.0.0].

## Usage

```hcl
module "harness-delegate" {
    source       = "git::https://oauth2:<token>@gitlab.com/kwdevops/gcp-terraform-modules//harness-delegate?ref=delegate"
    name         = "harness-delegate"
    tags         = "ssh"
    machine_type = "n1-standard-1"
    zone         = "us-east1-b"
    image        = "ubuntu-1904-disco-v20191020"
    subnetwork   = "subnet-01" 
    start-up-script-name = "start-up-script"
}
```
