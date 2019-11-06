resource "google_compute_address" "instances" {
  count = var.amount
  name  = var.name_prefix-count.index
}

resource "google_compute_instance" "default" {
  count        = var.amount
  name         = var.name_prefix-count.index+1
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