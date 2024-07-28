terraform {
  required_version = ">= 1.9.3, < 2.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.38.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.38.0"
    }
  }
}

resource "google_storage_bucket" "random14573092305" {
  location = "asia-northeast1"
  name     = "random14573092305"
}