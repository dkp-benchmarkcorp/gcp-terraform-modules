output "cluster_name" {
  value       = google_container_cluster.primary.name
  description = "Name of the GKE Cluster."
}

output "location" {
  value       = google_container_cluster.primary.location
  description = "Region the Cluster is created in GKE Cluster."
}

output "project" {
  value       = google_container_cluster.primary.project
  description = "The Project that contains the GKE Cluster."
}