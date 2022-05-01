# Digitalocean Spaces bucket Terraform module

Terraform Module for create [DigitalOcean Spaces bucket](https://www.digitalocean.com/products/spaces) resources.

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

## Requirements

This module requires Terraform version `0.13.0` or newer.

## Examples

```hcl
module "bucket" {
  source             = "../../"
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
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_spaces_bucket.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/spaces_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | Canned ACL applied on bucket creation (private or public-read) | `string` | `"private"` | no |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | cors\_rule object supports the following | <pre>list(object({<br>    allowed_headers = list(string)<br>    allowed_methods = list(string)<br>    allowed_origins = list(string)<br>    max_age_seconds = number<br>  }))</pre> | `[]` | no |
| <a name="input_lifecycle_rule"></a> [lifecycle\_rule](#input\_lifecycle\_rule) | lifecycle\_rule object supports the following | <pre>list(object({<br>    id                                     = string<br>    prefix                                 = string<br>    enabled                                = bool<br>    abort_incomplete_multipart_upload_days = number<br>    expiration = object({<br>      date                         = string<br>      days                         = number<br>      expired_object_delete_marker = bool<br>    })<br>    noncurrent_version_expiration = object({<br>      days = number<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the bucket | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region where the bucket resides (Defaults to nyc3) | `string` | `"nyc3"` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_domain_name"></a> [bucket\_domain\_name](#output\_bucket\_domain\_name) | The FQDN of the bucket (e.g. bucket-name.nyc3.digitaloceanspaces.com) |
| <a name="output_name"></a> [name](#output\_name) | The name of the bucket |
| <a name="output_region"></a> [region](#output\_region) | The name of the region |
| <a name="output_urn"></a> [urn](#output\_urn) | The uniform resource name for the bucket |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
