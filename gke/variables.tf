variable "cluster" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
}

variable "node_pool" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
}

