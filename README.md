<!-- BEGIN_TF_DOCS -->
[![Geek Cell GmbH](https://raw.githubusercontent.com/geekcell/template-terraform-module/main/docs/assets/logo.svg)](https://www.geekcell.io/)

### Code Quality
[![License](https://img.shields.io/github/license/geekcell/terraform-aws-s3)](https://github.com/geekcell/terraform-aws-s3/blob/master/LICENSE)
[![GitHub release (latest tag)](https://img.shields.io/github/v/release/geekcell/terraform-aws-s3?logo=github&sort=semver)](https://github.com/geekcell/terraform-aws-s3/releases)
[![Release](https://github.com/geekcell/terraform-aws-s3/actions/workflows/release.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-s3/actions/workflows/release.yaml)
[![Validate](https://github.com/geekcell/terraform-aws-s3/actions/workflows/validate.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-s3/actions/workflows/validate.yaml)
[![Lint](https://github.com/geekcell/terraform-aws-s3/actions/workflows/linter.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-s3/actions/workflows/linter.yaml)

### Security
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=INFRASTRUCTURE+SECURITY)

#### Cloud
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=CIS+AWS+V1.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=CIS+AWS+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=CIS+AZURE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/cis_azure_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=CIS+AZURE+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=CIS+GCP+V1.1)

##### Container
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/cis_kubernetes_16)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=CIS+KUBERNETES+V1.6)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/cis_eks_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=CIS+EKS+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/cis_gke_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=CIS+GKE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=CIS+KUBERNETES+V1.5)

#### Data protection
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=SOC2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=PCI-DSS+V3.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=PCI-DSS+V3.2.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=ISO27001)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=NIST-800-53)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=HIPAA)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-s3/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-s3&benchmark=FEDRAMP+%28MODERATE%29)

# Terraform AWS S3

This Terraform module provides a preconfigured solution for setting up
AWS S3 buckets in your AWS account. With this module, you can easily
and efficiently create and manage S3 buckets with advanced features
such as transitions, security, encryption, and public access restriction.
Our team has extensive experience working with AWS S3 and has optimized
this module to provide the best possible experience for users.

By using this Terraform module, you can save time and effort in setting up
and managing your S3 buckets, as well as ensure that your data is secure
and protected. The module encapsulates all necessary configurations,
making it easy to use and integrate into your existing AWS environment.
Whether you are just getting started with AWS S3 or looking for a more
efficient way to manage your buckets, this Terraform module provides a
preconfigured solution with advanced features.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_expiration"></a> [expiration](#input\_expiration) | The number of days after which to expunge the objects. | `number` | `0` | no |
| <a name="input_is_access_log_bucket"></a> [is\_access\_log\_bucket](#input\_is\_access\_log\_bucket) | If it is an Access Log Bucket, then the encryption on the bucket needs to be changed to AWS Managed Key. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the bucket. | `string` | n/a | yes |
| <a name="input_noncurrent_version_expiration"></a> [noncurrent\_version\_expiration](#input\_noncurrent\_version\_expiration) | The number of days after which to delete the noncurrent object. | `number` | `90` | no |
| <a name="input_noncurrent_version_transitions"></a> [noncurrent\_version\_transitions](#input\_noncurrent\_version\_transitions) | Transition to another storage class for noncurrent\_versions. | <pre>list(object({<br>    noncurrent_days = number<br>    storage_class   = string<br>  }))</pre> | <pre>[<br>  {<br>    "noncurrent_days": 30,<br>    "storage_class": "STANDARD_IA"<br>  }<br>]</pre> | no |
| <a name="input_policy"></a> [policy](#input\_policy) | A valid bucket policy JSON document. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS Customer Managed Key. | `map(any)` | `{}` | no |
| <a name="input_transitions"></a> [transitions](#input\_transitions) | Transition to another storage class. | <pre>list(object({<br>    days          = number<br>    storage_class = string<br>  }))</pre> | <pre>[<br>  {<br>    "days": 30,<br>    "storage_class": "STANDARD_IA"<br>  },<br>  {<br>    "days": 60,<br>    "storage_class": "GLACIER"<br>  },<br>  {<br>    "days": 180,<br>    "storage_class": "DEEP_ARCHIVE"<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The arn of the bucket. |
| <a name="output_id"></a> [id](#output\_id) | The id of the bucket. |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |

## Resources

- resource.aws_s3_bucket.main (main.tf#19)
- resource.aws_s3_bucket_lifecycle_configuration.main (main.tf#71)
- resource.aws_s3_bucket_metric.main (main.tf#104)
- resource.aws_s3_bucket_policy.is_access_log_bucket (main.tf#31)
- resource.aws_s3_bucket_policy.main (main.tf#25)
- resource.aws_s3_bucket_public_access_block.main (main.tf#37)
- resource.aws_s3_bucket_server_side_encryption_configuration.with_aws_managed_key (main.tf#46)
- resource.aws_s3_bucket_server_side_encryption_configuration.with_customer_managed_key (main.tf#58)
- data source.aws_elb_service_account.main (data.tf#1)
- data source.aws_iam_policy_document.access_log_bucket_policy (data.tf#3)

# Examples
### Basic Example
```hcl
module "basic-example" {
  source = "../../"
  name   = "my-bucket-123"
}
```
### with Transitions
```hcl
module "with-transitions" {
  source = "../../"
  name   = "my-bucket-123"

  transitions = [
    {
      storage_class = "STANDARD_IA"
      days          = 90
    }
  ]
}
```
### for Access Logs
```hcl
module "for-access-logs" {
  source = "../../"
  name   = "my-access-logs"

  is_access_log_bucket = true

  transitions = [
    {
      storage_class = "STANDARD_IA"
      days          = 90
    },
    {
      storage_class = "GLACIER"
      days          = 180
    }
  ]

  expiration = 365
}
```
<!-- END_TF_DOCS -->
