provider "google" {
  project = "my-dev-project-399904"
  region  = "us-central1"
}

resource "google_compute_disk" "disk" {
  name  = "my-disk"
  image = "debian-cloud/debian-11"
  size  = 50
  type  = "pd-ssd"
  zone  = "us-central1-a"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_snapshot" "snapdisk" {
  name        = "my-snapshot"
  source_disk = google_compute_disk.disk.name
  zone        = "us-central1-a"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_region_disk" "regiondisk" {
  name                      = "my-region-disk"
  snapshot                  = google_compute_snapshot.snapdisk.id
  type                      = "pd-ssd"
  region                    = "us-central1"
  physical_block_size_bytes = 4096
  replica_zones             = ["us-central1-a", "us-central1-f"]

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_instance" "instance" {
  name         = "my-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    source = google_compute_region_disk.regiondisk.self_link
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
