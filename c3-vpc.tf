# Resource: VPC
resource "google_compute_network" "tcsvpc" {
  name = "tcsvpc"
  auto_create_subnetworks = false   
}

# Resource: Subnet
resource "google_compute_subnetwork" "vmmysubnet" {
  name = "vmsubnet1"
  region = "europe-west2"
  ip_cidr_range = "10.128.0.0/20"
  network = google_compute_network.myvpc.id 
}
