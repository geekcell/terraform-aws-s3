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
