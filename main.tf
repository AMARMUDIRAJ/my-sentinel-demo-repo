data "google_compute_instance_template" "example-template12345" {
  self_link = "projects/my-dev-project-399904/global/instanceTemplates/example-template12345"
}

provider "google" {
  project = "my-dev-project-399904"
  region  = "us-central1"
}

resource "google_compute_instance_from_template" "instance" {
  name           = "instance-from-template"
  zone           = "us-central1-a"
  source_instance_template = data.google_compute_instance_template.example-template12345.self_link
}
