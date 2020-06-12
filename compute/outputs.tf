output "name" {
    value = google_compute_instance.default.*.name
    description = "The names of the instance being created"
}
output "instance_zone" {
    value = google_compute_instance.default.*.zone
    description = "The zone where the instance will be created"
}
output "subnet_name" {
    value = google_compute_instance.default[*].network_interface.subnetwork
    description = "The names of the subnetwork the instances will be located"
}
output "instance_ip_addr" {
  value = google_compute_instance.default[*].network_interface.0.access_config.0.nat_ip
} 
