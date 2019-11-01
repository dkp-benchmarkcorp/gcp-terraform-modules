resource "google_compute_firewall" "default" {
  count = length(var.firewall)
  name    = lookup(var.firewall[count.index]), "name", ""))
  network = module.vpc.network_name

  allow {
    protocol = lookup(var.firewall[count.index]), "protocol", ""))
    ports    = lookup(var.firewall[count.index]), "ports", ""))
  }

  source_tags = compact(split(",", lookup(var.firewall[count.index], "tags", "")))
}