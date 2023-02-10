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
