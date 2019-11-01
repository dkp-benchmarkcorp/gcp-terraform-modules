variable "firewall" {
  type        = list(map(string))
  description = "List of firewall rules"
  default     = []
}

variable "port" {
  type        = list(map(list))
  description = "List of firewall rules"
  default     = []
}