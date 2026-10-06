variable "BACKEND_LOG_GROUP_NAME" {
  description = "Name of the CloudWatch log group for the backend service"
  type        = string
}

variable "FRONTEND_LOG_GROUP_NAME" {
  description = "Name of the CloudWatch log group for the frontend service"
  type        = string
}

variable "DATABASE_LOG_GROUP_NAME" {
  description = "Name of the CloudWatch log group for the database service"
  type        = string
}

variable "LOG_GROUP_RETENTION_DAYS" {
  description = "Number of days CloudWatch logs should be retained"
  type        = number
}

variable "COMMON_TAGS" {
  description = "Common tags for CloudWatch resources"
  type        = map(string)
}