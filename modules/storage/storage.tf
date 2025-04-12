# Create a Google Cloud Storage bucket
resource "google_storage_bucket" "Bucket_Name" {
  name          = "Bucket_Name"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}