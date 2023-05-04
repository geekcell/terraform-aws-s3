variable "name" {
  default     = "my-bucket"
  description = "Bucket name."
  type        = string
}

variable "policy" {
  default     = ""
  description = "Bucket policy."
  type        = string
}