resource "google_storage_bucket" "static-site" {
  name          = "image-store.com-2024-04-my-dev-project-399904"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = true


}