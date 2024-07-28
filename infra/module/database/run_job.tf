resource "google_artifact_registry_repository" "migration_alloydb" {
  location      = "asia-northeast1"
  repository_id = "migration-alloydb"
  description   = "migration docker repository"
  format        = "DOCKER"
}
