resource "google_compute_instance" "delegate" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = [var.tags]
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

metadata_startup_script = "${file("${path.module}/scripts/start-up-script.sh")}"

}

output "ip" {
  value = google_compute_instance.delegate.network_interface.0.access_config.0.nat_ip
}