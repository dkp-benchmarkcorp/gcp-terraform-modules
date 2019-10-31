locals {
  network_self_link = var.create_network ? google_compute_network.vpc_network[0].self_link : data.google_compute_network.vpc_network[0].self_link
  network_name      = var.create_network ? google_compute_network.vpc_network[0].name : data.google_compute_network.vpc_network[0].name
}
###VPC configuration
resource "google_compute_network" "vpc_network" {
    count                   = var.create_network ? 1 : 0
    name                    = var.network_name
    auto_create_subnetworks = var.auto_create_subnetworks
    routing_mode            = var.routing_mode
    description             = var.description
}

data "google_compute_network" "vpc_network" {
  count   = var.create_network ? 0 : 1
  name    = var.network_name
}


###	Shared VPC

#resource "google_compute_shared_vpc_host_project" "shared_vpc_host" {
#  count   = var.shared_vpc_host == "true" ? 1 : 0
#  project = var.project_id
#}

### SUBNETS

resource "google_compute_subnetwork" "subnetwork" {
     
      name          = var.subnetworks_name
      ip_cidr_range = var.subnetworks_cidr
      network       = local.network_self_link
      depends_on    = [google_compute_network.vpc_network]
      secondary_ip_range {
          range_name    = var.secondary_name
          ip_cidr_range = var.secondary_cidr
      }
  }

  data "google_compute_subnetwork" "created_subnets" {
  name    = google_compute_subnetwork.subnetwork.name
  region  = google_compute_subnetwork.subnetwork.region
}


###	Routes
 
resource "google_compute_route" "route" {
  count                  = length(var.routes)
  network                = local.network_name
  name                   = lookup(var.routes, "name", format("%s-%s-%d", lower(local.network_name), "route"))
  description            = lookup(var.routes, "description", "")
  tags                   = compact(split(",", lookup(var.routes, "tags", "")))
  dest_range             = lookup(var.routes[count.index], "destination_range", "")
  priority               = 1000

  depends_on = [
    google_compute_subnetwork.subnetwork,
  ]
}