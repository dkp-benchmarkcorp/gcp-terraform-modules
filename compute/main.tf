resource "google_compute_instance" "default" {
  amount        = var.amount
  name         = var.name_prefix-count.index
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network

  }
}