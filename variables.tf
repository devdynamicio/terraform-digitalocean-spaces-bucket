variable "name" {
  description = "The name of the bucket"
  type        = string
}

variable "region" {
  description = "The region where the bucket resides (Defaults to nyc3)"
  type        = string
  default     = "nyc3"
}

variable "acl" {
  default     = "private"
  type        = string
  description = "Canned ACL applied on bucket creation (private or public-read)"
}

variable "cors_rule" {
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    max_age_seconds = number
  }))
  description = "cors_rule object supports the following"
  default     = []
}

variable "lifecycle_rule" {
  type = list(object({
    id                                     = string
    prefix                                 = string
    enabled                                = bool
    abort_incomplete_multipart_upload_days = number
    expiration = object({
      date                         = string
      days                         = number
      expired_object_delete_marker = bool
    })
    noncurrent_version_expiration = object({
      days = number
    })
  }))
  description = "lifecycle_rule object supports the following"
  default     = []
}

variable "versioning" {
  description = "Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket."
  default     = false
  type        = bool
}
