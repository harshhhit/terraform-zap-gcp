terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.82.0" # Use an appropriate version
    }
  }

  backend "gcs" {
    bucket         = "staticsitejkvjyc"
    prefix         = "05_pipeline"
    
  }

  required_version = ">= 1.5.0"
}