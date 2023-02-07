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
