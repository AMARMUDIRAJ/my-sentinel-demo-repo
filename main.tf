provider "google" {
  project = "my-dev-project-399904"
  region  = "us-central1"
}

data "google_compute_region_disk" "regiondisk" {
  name   = "my-region-disk"
  region = "us-central1"
}

resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    source = data.google_compute_region_disk.regiondisk.self_link
  }

  network_interface {
    network = "my-own-network-dev"
    subnetwork = "web-subnet"
    access_config {}
  }
}
