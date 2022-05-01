resource "digitalocean_spaces_bucket" "this" {
  name   = var.name
  region = var.region
  acl    = var.acl

  dynamic "cors_rule" {
    for_each = var.cors_rule
    content {
      allowed_headers = cors_rule.value["allowed_headers"]
      allowed_methods = cors_rule.value["allowed_methods"]
      allowed_origins = cors_rule.value["allowed_origins"]
      max_age_seconds = cors_rule.value["max_age_seconds"]
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule
    content {
      id                                     = lifecycle_rule.value["id"]
      prefix                                 = lifecycle_rule.value["prefix"]
      enabled                                = lifecycle_rule.value["enabled"]
      abort_incomplete_multipart_upload_days = lifecycle_rule.value["abort_incomplete_multipart_upload_days"]
      expiration {
        date                         = lifecycle_rule.value.expiration["date"]
        days                         = lifecycle_rule.value.expiration["days"]
        expired_object_delete_marker = lifecycle_rule.value.expiration["expired_object_delete_marker"]
      }
      noncurrent_version_expiration {
        days = lifecycle_rule.value.noncurrent_version_expiration["days"]
      }
    }
  }

  versioning {
    enabled = var.versioning
  }

}
