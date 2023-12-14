terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.82.0" # Use an appropriate version
    }
  }
}
provider "google" {
  project     = var.projectid
}