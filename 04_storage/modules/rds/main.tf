resource "google_sql_database_instance" "cloud_sql_instance" {
  name             = "cloud-sql-instance"
  database_version = "MYSQL_5_7"
  project = var.project
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
     disk_size  = 10  # Specify the size in GB

  ip_configuration {
  ipv4_enabled    = true
  
  
}

  }
}

resource "google_sql_user" "cloud_sql_user1" {
  name     = "user1"
  instance = google_sql_database_instance.cloud_sql_instance.name
  password = random_password.cloud_sql_admin.result
  project = var.project
}

resource "google_sql_user" "cloud_sql_user2" {
  name     = "user2"
  instance = google_sql_database_instance.cloud_sql_instance.name
  password = random_password.cloud_sql_admin.result
  project = var.project
}


resource "google_secret_manager_secret" "cloud_sql_secret" {
  secret_id = "cloud-sql-secrets"
  project = var.project

    replication {
    automatic = false
  }
}

resource "google_secret_manager_secret_version" "cloud_sql_secret_version" {
  secret            = google_secret_manager_secret.cloud_sql_secret.secret_id
  secret_data       = random_password.cloud_sql_admin.result
  
}

resource "random_password" "cloud_sql_admin" {
  length  = 20
  special = true
}