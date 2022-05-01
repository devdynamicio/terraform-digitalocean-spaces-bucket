module "bucket" {
  source = "../../"
  name   = "bucket-test-example"
  region = "fra1"
  cors_rule = [
    {
      allowed_headers = ["*"]
      allowed_methods = ["GET"]
      allowed_origins = ["*"]
      max_age_seconds = 3000
    },
    {
      allowed_headers = ["*"]
      allowed_methods = ["PUT", "POST", "DELETE"]
      allowed_origins = ["https://www.example.com"]
      max_age_seconds = 3000
    }
  ]
}

provider "digitalocean" {
}
