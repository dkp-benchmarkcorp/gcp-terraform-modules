variable "firewall" {
  type        = list(map(string))
  description = "List of firewall rules"
  default     = []
}

variable "network_name" {
    description = "vpc_network"
    type        = "string"
}