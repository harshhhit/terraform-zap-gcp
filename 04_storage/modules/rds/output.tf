output "sql_instance_ip" {
  value = google_sql_database_instance.cloud_sql_instance.ip_address
}

output "sql_instance_connection_name" {
  value = google_sql_database_instance.cloud_sql_instance.connection_name
}