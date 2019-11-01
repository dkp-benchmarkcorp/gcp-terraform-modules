resource "google_compute_firewall" "default" {
  for_each = lookup(var.firewall, "name", "")
  name    = each.value
  for_each = lookup(var.firewall, "network", "")
  network = each.value

  allow {
    for_each = lookup(var.firewall, "protocol", "")
    protocol = each.value
    for_each = lookup(var.firewall, "ports", "")
    ports    = each.value
  }

for_each = lookup(var.firewall, "source_tags", "")
source_tags = each.value
}
