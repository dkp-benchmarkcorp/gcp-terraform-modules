resource "google_compute_instance" "default" {
  provider                  = google-beta
  allow_stopping_for_update = true
  // this above line may not be required
  count                     = var.amount
  name                      = "${var.name_prefix}-${count.index+1}"
  machine_type              = var.machine_type
  zone                      = var.zone
  tags                      = [var.tags]
  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = var.subnetwork
    access_config {
      // Ephemeral IP
    }
  }
metadata = {
    startup-script = "${file("${path.root}/scripts/${var.startup-script}")}"
}
}