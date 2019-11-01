variable "firewall" {
  type        = list(map(string))
  description = "List of firewall rules"
  default     = []
}

variable "port" {
  type        = string
  description = "List of firewall rules"
  default     = []
}

variable "source_tag" {
  type        = string
  description = "List of firewall rules"
  default     = []
}