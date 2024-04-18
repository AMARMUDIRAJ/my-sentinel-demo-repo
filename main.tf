provider "google" {
  project = "my-dev-project-399904"
  region  = "us-central1"
}
resource "google_compute_instance_from_template" "tpl" {
  name = "instance-from-template"
  zone = "us-central1-a"

  source_instance_template = "https://www.googleapis.com/compute/v1/projects/my-dev-project-399904/global/instanceTemplates/example-template"

  // Override fields from instance template
  can_ip_forward = false
  labels = {
    my_key = "my_value"
  }
}