# Resource Block: Create a single Compute Engine instance
resource "google_compute_instance" "tcsapp" {
  name         = "tcsapp"
  machine_type = "e2-micro"
  zone         = "europe-west2-a"
  tags        = [tolist(google_compute_firewall.fw_ssh.target_tags)[0], tolist(google_compute_firewall.fw_http.target_tags)[0]]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  # Install Webserver
  metadata_startup_script = file("${path.module}/app1-webserver-install.sh")
  network_interface {
    subnetwork = google_compute_subnetwork.mysubnet.id 
    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
