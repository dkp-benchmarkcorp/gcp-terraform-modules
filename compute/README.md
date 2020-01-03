# Terraform Compute Module

This module handles compute creation in gcp
The resources/services/activations/deletions that this module will create/trigger are:
- Create Compute Instances
- Requires start up script in /scripts/var.script-name in your terraform root

## Compatibility

This module is meant for use with Terraform 0.12. If you haven't
[upgraded][terraform-0.12-upgrade] and need a Terraform
0.11.x-compatible version of this module, the last released version
intended for Terraform 0.11.x is [3.0.0].

## Usage

```hcl
module "compute" {
    source = "git::https://gitlab.com/kwdevops/gcp-terraform-modules//compute"
     
    amount         = 2
    tags           = "ssh"
    name_prefix    = "web"
    machine_type   = "n1-standard-1"
    zone           = "us-east1-b"
    image          = "ubuntu-1904-disco-v20191019"
    subnetwork     = "default"
    startup-script = "harness-delegate"
}   
```
