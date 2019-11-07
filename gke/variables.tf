variable "cluster" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
}

variable "node_pools" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
}

variable "master_authorized_networks_config" {
  type        = list(object({ cidr_blocks = list(object({ cidr_block = string, display_name = string })) }))
  description = "The desired configuration options for master authorized networks. The object format is {cidr_blocks = list(object({cidr_block = string, display_name = string}))}. Omit the nested cidr_blocks attribute to disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default     = []
}