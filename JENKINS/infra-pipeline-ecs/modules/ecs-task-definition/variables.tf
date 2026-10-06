variable "BACKEND_TASK_DEFINITION_FAMILY" {
  type = string
}

variable "FRONTEND_TASK_DEFINITION_FAMILY" {
  type = string
}

variable "DATABASE_TASK_DEFINITION_FAMILY" {
  type = string
}


variable "ECS_NETWORK_MODE" {
  type = string
}

variable "ECS_REQUIRES_COMPATIBILITIES" {
  type = list(string)
}

variable "ECS_TASK_CPU" {
  type = string
}

variable "ECS_TASK_MEMORY" {
  type = string
}

variable "ECS_TASK_EXECUTION_ROLE_ARN" {
  type = string
}


# ---------------------------------------------------------
# Backend
# ---------------------------------------------------------

variable "BACKEND_CONTAINER_NAME" {
  type = string
}

variable "BACKEND_IMAGE" {
  type = string
}

variable "BACKEND_CONTAINER_PORT" {
  type = number
}

variable "BACKEND_DB_NAME" {
  type = string
}

variable "BACKEND_DB_HOST" {
  type = string
}

variable "BACKEND_DB_PORT" {
  type = string
}

variable "BACKEND_DB_USER" {
  type = string
}

variable "BACKEND_DB_PASSWORD" {
  type      = string
  sensitive = true
}

variable "BACKEND_LOG_GROUP_NAME" {
  type = string
}


# ---------------------------------------------------------
# Frontend
# ---------------------------------------------------------

variable "FRONTEND_CONTAINER_NAME" {
  type = string
}

variable "FRONTEND_IMAGE" {
  type = string
}

variable "FRONTEND_CONTAINER_PORT" {
  type = number
}

variable "FRONTEND_BACKEND_HOST" {
  type = string
}

variable "FRONTEND_LOG_GROUP_NAME" {
  type = string
}


# ---------------------------------------------------------
# Database
# ---------------------------------------------------------

variable "DATABASE_CONTAINER_NAME" {
  type = string
}

variable "DATABASE_IMAGE" {
  type = string
}

variable "DATABASE_CONTAINER_PORT" {
  type = number
}

variable "DATABASE_NAME" {
  type = string
}

variable "DATABASE_ROOT_PASSWORD" {
  type      = string
  sensitive = true
}

variable "DATABASE_LOG_GROUP_NAME" {
  type = string
}


# ---------------------------------------------------------
# AWS
# ---------------------------------------------------------

variable "AWS_REGION" {
  type = string
}