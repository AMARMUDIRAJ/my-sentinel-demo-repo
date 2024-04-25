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

resource "google_compute_instance_from_template" "tpl" {
  name = "instance-from-template"
  zone = "us-central1-a"

  source_instance_template = google_compute_instance_template.example.self_link

  // Override fields from instance template
  can_ip_forward = false
  labels = {
    my_key = "my_value"
  }
}

######################
