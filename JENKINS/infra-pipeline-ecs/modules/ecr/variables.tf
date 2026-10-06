variable "BACKEND_REPOSITORY_NAME" {
  description = "Name of the backend ECR repository"
  type        = string
}

variable "FRONTEND_REPOSITORY_NAME" {
  description = "Name of the frontend ECR repository"
  type        = string
}

variable "DATABASE_REPOSITORY_NAME" {
  description = "Name of the database ECR repository"
  type        = string
}

variable "IMAGE_TAG_MUTABILITY" {
  description = "Image tag mutability setting for ECR repositories"
  type        = string
}

variable "SCAN_ON_PUSH" {
  description = "Enable image scanning when an image is pushed"
  type        = bool
}

variable "ENCRYPTION_TYPE" {
  description = "Encryption type for ECR repositories"
  type        = string
}

variable "COMMON_TAGS" {
  description = "Common tags for ECR repositories"
  type        = map(string)
}