resource "google_service_account" "migration_alloydb_job" {
  account_id  = "migration-alloydb-job"
  description = "for migration job"
}

resource "google_project_iam_member" "migration_alloydb_job" {
  for_each = toset([
    "roles/artifactregistry.reader",
    "roles/alloydb.admin",
    "roles/serviceusage.serviceUsageConsumer",
  ])
  project = data.google_project.current.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.migration_alloydb_job.email}"
}
