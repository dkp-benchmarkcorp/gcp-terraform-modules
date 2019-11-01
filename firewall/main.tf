resource "google_compute_firewall" "default" {
  count = length(var.firewall)
  name    = lookup(var.firewall[count.index], "name", "")
  network = lookup(var.firewall[count.index], "network", "")

  allow {
    protocol = lookup(var.firewall[count.index], "protocol", "")
    ports    = element(lookup(var.firewall[count.index], "ports", ""),count.index)
  }

source_tags = element(lookup(var.firewall[count.index], "source_tags", ""),count.index)
}