variable "firewall" {
  type        = list(map(string))
  description = "List of firewall rules"
  default     = []
}

variable "port" {
  type        = list(string)
  description = "List of firewall rules"
}

variable "source_tag" {
  type        = list(string)
  description = "List of firewall rules"
}