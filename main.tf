provider "google" {
  project = "my-dev-project-399904"
  region  = "us-central1"
}

data "google_compute_region_disk" "existing_regiondisk" {
  name   = "my-region-disk"
  region = "us-central1"
}

resource "google_compute_instance" "instance" {
  name         = "my-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    source = data.google_compute_region_disk.existing_regiondisk.self_link
  }

  network_interface {
    network = "default"
  }

  lifecycle {
    prevent_destroy = true
  }
}
