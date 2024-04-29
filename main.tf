provider "google" {
  project = "my-dev-project-399904"
  region  = "us-central1"
}
resource "google_compute_instance_template" "example" {
  name        = "example-template"
  machine_type = "e2-medium"
  disk {
    source_image = "debian-cloud/debian-10"
    auto_delete  = true
  }
  network_interface {
    network = "my-own-network-dev"
	subnetwork = "web-subnet"
    access_config {}
  }
}

output "template_self_link" {
  value = google_compute_instance_template.example.self_link
}
