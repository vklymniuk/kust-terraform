terraform {
backend "gcs" {
    credentials = "./key.json"
    bucket      = "kustceramics"
    prefix      = "terraform/state"
  }
}