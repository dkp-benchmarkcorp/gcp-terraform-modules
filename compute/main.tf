resource "google_compute_instance" "default" {
  count = var.count
  name         = var.name_prefix-count.index
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network

  }

  metadata = {
    foo = "bar"
  }
}