###VPC configuration
resource "google_compute_network" "vpc_network" {
    name                    = var.vpc_name
    auto_create_subnetworks = var.auto_create_subnetworks
    routing_mode            = var.routing_mode
}

### SUBNETS

resource "google_compute_subnetwork" "default" {
      name          = var.subnetworks_name
      ip_cidr_range = var.subnetworks_cidr
      network       = "${google_compute_network.default.self_link}" 
      secondary_ip_range {
          range_name = var.secondary_name
          ip_cidr_range = var.secondary_cidr
      }
  }