# outputs.tf (code_build module)

output "artifact" {
  value = google_cloudbuild_trigger.filename-trigger.id
}
