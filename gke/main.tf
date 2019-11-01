resource "google_container_cluster" "primary" {
  count             = length(var.cluster)
  name              = lookup(var.cluster[count.index], "name", "")
  description       = lookup(var.cluster[count.index], "description", "")

  location          = lookup(var.cluster[count.index], "location", "")
  node_locations    = lookup(var.cluster[count.index], "node_locations", "")
  cluster_ipv4_cidr = lookup(var.cluster[count.index], "cluster_ipv4_cidr", "")
  network           = lookup(var.cluster[count.index], "network", "")
  network_policy    = lookup(var.cluster[count.index], "network_policy", "")
 
  remove_default_node_pool = true
  initial_node_count = lookup(var.cluster[count.index], "initial_node_count", "")

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}