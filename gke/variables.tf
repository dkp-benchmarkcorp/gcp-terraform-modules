variable "cluster" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
}

variable "node_pools" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
}

variable "master_authorized_networks_config" {
  type = "list"

  description = <<EOF
  The desired configuration options for master authorized networks. Omit the nested cidr_blocks attribute to disallow external access (except the cluster node IPs, which GKE automatically whitelists)
  ### example format ###
  master_authorized_networks_config = [{
    cidr_blocks = [{
      cidr_block   = "10.0.0.0/8"
      display_name = "example_network"
    }],
  }]
  EOF
   default = []
}