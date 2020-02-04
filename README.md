# Terraform modules for GCP 

A registry of modules to create a GCP environment 
The resources/services/activations/deletions that these modules include are:
- Module for creation of VPC
    - network
    - subnetworks
    - secondary networks
    - routes
- Module for NAT
    - cloud router
    - nat
- Module for Firewall Rules
    - firewall rules ingress/egress
- Module for GKE
    - private GKE cluster
    - node Pool

## Compatibility

This module is meant for use with Terraform 0.12. If you haven't
[upgraded][terraform-0.12-upgrade] and need a Terraform
0.11.x-compatible version of this module, the last released version
intended for Terraform 0.11.x is [3.0.0].

## Usage

```hcl
module "<module>" {
    source = "git::https://github.com/benchmarkconsulting/gcp-terraform-modules//<module>"
```
