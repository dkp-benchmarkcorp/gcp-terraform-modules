# Terraform modules for GCP 

A registry of modules to create a GCP environment 
The resources/services/activations/deletions that this module will create/trigger are:
- Module for VPN
- Module for NAT
- Module for Firewall Rules
- Module for GKE

## Compatibility

This module is meant for use with Terraform 0.12. If you haven't
[upgraded][terraform-0.12-upgrade] and need a Terraform
0.11.x-compatible version of this module, the last released version
intended for Terraform 0.11.x is [3.0.0].

## Usage

```hcl
module "<module>" {
    source = "git::https://gitlab.com/kwdevops/gcp-terraform-modules//<module>"
```