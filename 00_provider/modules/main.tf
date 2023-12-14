resource "google_storage_bucket" "static-site" {
  name          = "staticsitejkvjyc"
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
#   cors {
#     origin          = ["http://image-store.com"]
#     method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
#     response_header = ["*"]
#     max_age_seconds = 3600
#   }
# }



  # Uncomment the following block if you want to enable versioning for the bucket
  # versioning {
  #   enabled = true
  # }

  # Uncomment the following block if you want to configure lifecycle rules for the bucket
  # lifecycle_rule {
  #   action {
  #     type = "SetStorageClass"
  #     storage_class = "NEARLINE" # Replace with your desired storage class
  #   }
  #   condition {
  #     age = 30 # Replace with your desired age in days
  #   }
  # }

  # Uncomment the following block if you want to configure access control for the bucket
  # iam_configuration {
  #   bucket_policy_only = true
  # }

