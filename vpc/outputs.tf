output "network_name" {
  value       = local.network_name
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = local.network_self_link
  description = "The URI of the VPC being created"
}

output "subnet_names" {
  value       = google_compute_subnetwork.subnet.name
  description = "The names of the subnets being created"
}

output "subnet_ips" {
  value       = google_compute_subnetwork.subnet.ip_cidr_range
  description = "The IPs and CIDRs of the subnets being created"
}

output "subnet_self_links" {
  value       = google_compute_subnetwork.subnet.self_link
  description = "The self-links of subnets being created"
}

output "subnet_regions" {
  value       = google_compute_subnetwork.subnet.region
  description = "The region where the subnets will be created"
}

output "subnet_secondary_ranges" {
  value       = google_compute_subnetwork.subnet.secondary_ip_range
  description = "The secondary ranges associated with these subnets"
}

#output "routes" {
#  value       = google_compute_route.route[count.index].name
#  description = "The routes associated with this VPC"
#}