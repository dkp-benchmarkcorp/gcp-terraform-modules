output "cluster_names"{
    value = google_container_cluster.primary.*.name
    description = "The names of the clusters created in the VPC"
}

output "cluster_locations"{
    value = google_container_cluster.primary.*.location
    description = "The regions or zones in which the cluster will be created"
}

output "network_name"{
    value = google_container_cluster.primary.*.network
    description = "The name of the network the cluster is connected to"
}

output "subnet_name"{
    value = google_container_cluster.primary.*.subnetwork
    description = "The name of the network the cluster is connected to"
}

output "priv_cluster_cidr"{
    value = google_container_cluster.primary[*].private_cluster_config.master_ipv4_cidr_block
    description = "The IP range to use for the master network"
}

output "cluster_secondary_ranges"{
    value = google_container_cluster.primary[*].ip_allocation_policy.cluster_secondary_range_name
    description = "The secondary ranges in the cluster's subnet for IP addresses"
}

output "serv_secondary_ranges"{
    value = google_container_cluster.primary[*].ip_allocation_policy.services_secondary_range_name
    description = "The secondary ranges in the cluster's subnet for service use"
}

output "node_names" {
    value = google_container_node_pool.primary_preemptive_nodes.*.name
    description = "The names of the node pools created"
}