output "instance_ip_addr" {
  value = google_compute_instance.default.network_interface.[*].access_config.[*].nat_ip
}