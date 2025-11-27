variable "bucket_name" {
  type        = string
  description = "The name of the bucket."
}

# TODO: Remove. No longer needed
variable "aws_open_data" {
  type        = bool
  default     = false
  description = "Whether or not bucket is uses AWS Open Data rules."
}

variable "heroku_user" {
  description = "The Heroku API IAM user who will have write access to the bucket."
}

variable "embargo_readers" {
  description = "Other IAM users (besides `heroku_user`) that will have read access to embargoed objects."
  default     = []
}

variable "log_bucket_name" {
  type        = string
  description = "The name of the log bucket."
}
