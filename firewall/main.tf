resource "google_compute_firewall" "default" {
  count = length(var.firewall)
  name    = lookup(var.firewall[count.index])
  network = module.vpc.network_name

  allow {
    protocol = lookup(var.firewall[count.index])
    ports    = lookup(var.firewall[count.index])
  }

  source_tags = compact(split(",", lookup(var.firewall[count.index], "tags", "")))
}