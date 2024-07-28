resource "google_artifact_registry_repository" "migration_alloydb" {
  location      = "asia-northeast1"
  repository_id = "migration-alloydb"
  description   = "migration docker repository"
  format        = "DOCKER"
}

resource "google_cloud_run_v2_job" "migration" {
  name     = "migration"
  location = "asia-northeast1"
  template {
    template {
      service_account = google_service_account.migration_alloydb_job.email
      containers {
        image = "asia-northeast1-docker.pkg.dev/${google_artifact_registry_repository.migration_alloydb.project}/${google_artifact_registry_repository.migration_alloydb.repository_id}/migration:latest"
      }
      vpc_access {
        connector = google_vpc_access_connector.connector.id
      }
    }
  }
}
