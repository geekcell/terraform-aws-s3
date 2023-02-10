/**
 * # Terraform AWS S3
 *
 * This Terraform module provides a preconfigured solution for setting up
 * AWS S3 buckets in your AWS account. With this module, you can easily
 * and efficiently create and manage S3 buckets with advanced features
 * such as transitions, security, encryption, and public access restriction.
 * Our team has extensive experience working with AWS S3 and has optimized
 * this module to provide the best possible experience for users.
 *
 * By using this Terraform module, you can save time and effort in setting up
 * and managing your S3 buckets, as well as ensure that your data is secure
 * and protected. The module encapsulates all necessary configurations,
 * making it easy to use and integrate into your existing AWS environment.
 * Whether you are just getting started with AWS S3 or looking for a more
 * efficient way to manage your buckets, this Terraform module provides a
 * preconfigured solution with advanced features.
 */
resource "aws_s3_bucket" "main" {
  bucket = var.name

  tags = var.tags
}

resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.main.id
  policy = var.policy
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = module.kms.key_arn
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "main" {
  bucket = aws_s3_bucket.main.bucket

  rule {
    id     = "transitions"
    status = "Enabled"

    dynamic "transition" {
      for_each = coalesce(var.transitions, [])
      content {
        days          = transition.value.days
        storage_class = transition.value.storage_class
      }
    }

    dynamic "noncurrent_version_transition" {
      for_each = coalesce(var.noncurrent_version_transitions, [])
      content {
        noncurrent_days = noncurrent_version_transition.value.noncurrent_days
        storage_class   = noncurrent_version_transition.value.storage_class
      }
    }

    expiration {
      days = var.expiration
    }

    noncurrent_version_expiration {
      noncurrent_days = var.noncurrent_version_expiration
    }
  }
}

resource "aws_s3_bucket_metric" "main" {
  bucket = aws_s3_bucket.main.bucket
  name   = "EntireBucket"
}

module "kms" {
  source = "github.com/geekcell/terraform-aws-kms?ref=v1.0"

  alias = format("alias/s3/bucket/%s", var.name)
}
