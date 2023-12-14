resource "google_cloudbuild_trigger" "filename-trigger" {
    project = var.project
    

  trigger_template {
    branch_name = var.repo_branch
    repo_name   = var.repo_name
  }
  filename = "cloudbuil.yaml"
}