resource "google_compute_firewall" "default" {
  for_each = var.firewall
  name    = lookup(each.value, "name", "")
  network = lookup(each.value, "network", "")

  allow {
    protocol = lookup(each.value, "protocol", "")
    ports    = lookup(each.value, "ports", "")
  }

source_tags = lookup(each.value, "source_tags", "")
}
