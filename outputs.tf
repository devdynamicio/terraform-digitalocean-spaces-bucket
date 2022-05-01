output "name" {
  value       = digitalocean_spaces_bucket.this.name
  description = "The name of the bucket"
}

output "urn" {
  value       = digitalocean_spaces_bucket.this.urn
  description = "The uniform resource name for the bucket"
}

output "region" {
  value       = digitalocean_spaces_bucket.this.region
  description = "The name of the region"
}

output "bucket_domain_name" {
  value       = digitalocean_spaces_bucket.this.bucket_domain_name
  description = "The FQDN of the bucket (e.g. bucket-name.nyc3.digitaloceanspaces.com)"
}
