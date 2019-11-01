variable "firewall" {
  type        = list(map(string))
  description = "List of firewall rules"
  default     = []
}