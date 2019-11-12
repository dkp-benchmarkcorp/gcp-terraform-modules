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
}
provisioner "file" {
    source      = "/conf/delegte.sh"
    destination = "/home/ubuntu/delegate.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/delegate.sh",
      "/home/ubuntu/delegate.sh",
    ]
  }
}