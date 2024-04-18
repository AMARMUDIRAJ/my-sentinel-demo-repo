terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  project     = "my-dev-project-399904"
  region      = "us-central1"
}