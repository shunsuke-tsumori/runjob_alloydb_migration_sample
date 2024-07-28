resource "google_alloydb_cluster" "db_cluster" {
  cluster_id = "db-cluster"
  location   = "asia-northeast1"

  network_config {
    network = google_compute_network.db_network.id
  }
}

resource "google_alloydb_instance" "db_instance" {
  cluster       = google_alloydb_cluster.db_cluster.id
  instance_id   = "db-instance"
  instance_type = "PRIMARY"

  machine_config {
    cpu_count = 2
  }
}

resource "google_alloydb_user" "db_admin" {
  cluster        = google_alloydb_cluster.db_cluster.id
  user_id        = "db-admin"
  user_type      = "ALLOYDB_BUILT_IN"
  # 本来はシークレットマネージャなどを使用するべき
  password       = var.password
  database_roles = ["alloydbsuperuser"]
}
