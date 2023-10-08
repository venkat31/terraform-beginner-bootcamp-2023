variable "user_uuid" {
  description = "A valid UUID"
  type        = string

  validation {
   condition        = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
   error_message = "Invalid UUID format. Please provide a valid UUID."
  }
}
