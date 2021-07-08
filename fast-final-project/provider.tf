// Configure the Google Cloud provider
provider "google" {
  credentials = file("./final-sneo-project-gcp-01.json")
  project     = "final-sneo-project-gcp-01"
  region      = "us-west1"
}
