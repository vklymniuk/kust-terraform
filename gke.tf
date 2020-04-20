resource "google_container_cluster" "primary" {
 provider    = google-beta
  name        = "${var.gke_name}"
  location    = "${var.region}"
  network     = "${var.gke_network}"
  remove_default_node_pool = true
  initial_node_count       = 1
  enable_binary_authorization = true
  enable_intranode_visibility = true
  enable_legacy_abac          = false
  enable_shielded_nodes       = true 
  enable_tpu                  = false
  logging_service             = "logging.googleapis.com/kubernetes"
  monitoring_service          = "monitoring.googleapis.com/kubernetes"

  ip_allocation_policy {
    cluster_ipv4_cidr_block = "10.56.0.0/14"
  }


  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "${var.vpn_ip}"
      display_name = "VPN"
    }
  }

  private_cluster_config {
    enable_private_nodes = true
    enable_private_endpoint = false
    master_ipv4_cidr_block = "172.16.40.0/28"
  }
  
  pod_security_policy_config {
      enabled = false
    }
  
  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = true
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "kust-node-pool"
  location   = "${var.region}"
  cluster    = "${var.gke_name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "${var.gke_node_instance_type}"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
