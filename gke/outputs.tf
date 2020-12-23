output "cluster_names"{
    value = google_container_cluster.primary[*].name
    description = "The name of the gke cluster"
}

output "cluster_locations"{
    value = google_container_cluster.primary[*].location
    description = "The name of the gke cluster"
}

output "node_pools_names"{
    value = concat([for np in google_container_node_pool.pools : np.name], [""])
    description = "The name of the gke cluster"
}


# # output "project_name"{
# #     value = google_container_cluster.primary.project
# #     description = "The name of the project tht contains the cluster"
# # }