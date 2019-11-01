resource "google_compute_firewall" "default" {
  count = length(var.firewall)
  name    = lookup(var.firewall[count.index], "name", "")
  network = lookup(var.firewall[count.index], "network", "")

  allow {
    protocol = lookup(var.firewall[count.index], "protocol", "")
    for_each = lookup(var.firewall[count.index], "ports", "")
    ports    = each.value
  }

for_each = lookup(var.firewall[count.index], "source_tags", "")
source_tags = each.value
}
