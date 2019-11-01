resource "google_compute_firewall" "default" {
  count = length(var.firewall)
  name    = lookup(var.firewall[count.index], "name", "")
  network = lookup(var.firewall[count.index], "network", "")

  allow {
    protocol = lookup(var.firewall[count.index], "protocol", "")
   # ports    = lookup(var.firewall[count.index], "ports", "")
    ports    = element(split(",",lookup(var.firewall, "ports")),count.index)
  }

 # source_tags = lookup(var.firewall[count.index], "source_tags", "")
  source_tags = element(split(",",lookup(var.firewall, "source_tags")),count.index)
}