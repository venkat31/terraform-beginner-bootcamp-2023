variable "user_uuid" {
  description = "A valid UUID"
  type        = string

  validation {
   condition        = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
   error_message = "Invalid UUID format. Please provide a valid UUID."
  }
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "Bucket name must be between 3 and 63 characters long"
  }
  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-.]*[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must start and end with a lowercase letter or number, and can contain only lowercase letters, numbers, periods, and hyphens"
  }
}

variable "index_html_path" {
    description = " The file for index.html"
    type = string
    validation {
    condition     = fileexists(var.index_html_path)
    error_message = "filename doesn't exist"
  }
}

variable "error_html_path" {
    description = " The file for index.html"
    type = string
    validation {
    condition     = fileexists(var.error_html_path)
    error_message = "filename doesn't exist"
  }
}

variable "content_version" {
  description = "Version of the content"
  type        = number
  default     = 1

  validation {
    condition     = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "Content version must be a positive integer starting at 1."
  }
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}
