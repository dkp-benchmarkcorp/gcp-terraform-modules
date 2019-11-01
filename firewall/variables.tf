variable "firewall" {
  type        = list(map(string))
  description = "List of firewall rules"
  default     = []
}

variable "port" {
  type        = list
  description = "List of firewall rules"
  default     = []
}

variable "source_tag" {
  type        = list
  description = "List of firewall rules"
  default     = []
}