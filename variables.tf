# Context
variable "tags" {
  default     = {}
  description = "Tags to add to the AWS Customer Managed Key."
  type        = map(any)
}

# AWS S3
variable "name" {
  description = "The name of the bucket."
  type        = string
}

variable "expiration" {
  default     = 0
  description = "The number of days after which to expunge the objects."
  type        = number
}

variable "noncurrent_version_expiration" {
  default     = 90
  description = "The number of days after which to delete the noncurrent object."
  type        = number
}

variable "noncurrent_version_transitions" {
  default = [
    {
      noncurrent_days = 30
      storage_class   = "STANDARD_IA"
    }
  ]
  description = "Transition to another storage class for noncurrent_versions."
  type = list(object({
    noncurrent_days = number
    storage_class   = string
  }))
}

variable "policy" {
  default     = null
  description = "A valid bucket policy JSON document."
  type        = string
}

variable "transitions" {
  default = [
    {
      days          = 30
      storage_class = "STANDARD_IA"
    },
    {
      days          = 60
      storage_class = "GLACIER"
    },
    {
      days          = 180
      storage_class = "DEEP_ARCHIVE"
    }
  ]
  description = "Transition to another storage class."
  type = list(object({
    days          = number
    storage_class = string
  }))
}
