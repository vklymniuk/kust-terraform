resource "google_compute_firewall" "default" {
  name    = "allow-tcp-firewall"
  network = "default"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  allow {
      protocol = "tcp"
      ports = ["4444","4443"]
  }
  source_tags = ["ssh"]
  source_ranges           = [
        "54.219.241.86/32",
    ]
}
