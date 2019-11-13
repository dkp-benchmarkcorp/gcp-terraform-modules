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
metadata = {
    ssh-keys = "matt.s.cole"
  }
connection {
    type     = "ssh"
    user     = "matt.s.cole"
    private_key = "${file("~/.ssh/id_rsa)}"
    host     = self.network_interface.0.access_config.0.nat_ip
  }
provisioner "file" {
    source      = "conf/delegate.sh"
    destination = "/home/ubuntu/delegate.sh"
    
  }

provisioner "file" {
    source      = "conf/install_docker.sh"
    destination = "/home/ubuntu/install_docker.sh"
}
  provisioner "remote-exec" {
    inline = [
      "curl -fsSL https://get.docker.com -o /home/ubuntu/get-docker.sh",
      "sudo chmod +x /home/ubuntu/get-docker.sh",
      "sudo sh /home/ubuntu/get-docker.sh",
    ]
  }
}
output "ip" {
  value = google_compute_instance.delegate.network_interface.0.access_config.0.nat_ip
}