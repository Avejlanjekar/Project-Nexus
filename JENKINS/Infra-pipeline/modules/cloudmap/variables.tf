variable "VPC_ID" {
  description = "ID of the VPC where the Cloud Map namespace will be created"
  type        = string
}

variable "NAMESPACE_NAME" {
  description = "Private DNS namespace name"
  type        = string
}

variable "NAMESPACE_DESCRIPTION" {
  description = "Description of the Cloud Map namespace"
  type        = string
}

variable "BACKEND_SERVICE_NAME" {
  description = "Cloud Map service name for backend"
  type        = string
}

variable "FRONTEND_SERVICE_NAME" {
  description = "Cloud Map service name for frontend"
  type        = string
}

variable "DATABASE_SERVICE_NAME" {
  description = "Cloud Map service name for database"
  type        = string
}

variable "DNS_RECORD_TYPE" {
  description = "DNS record type used by Cloud Map services"
  type        = string
}

variable "DNS_RECORD_TTL" {
  description = "DNS record TTL for Cloud Map services"
  type        = number
}

variable "COMMON_TAGS" {
  description = "Common tags for Cloud Map resources"
  type        = map(string)
}

