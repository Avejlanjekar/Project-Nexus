variable "TASK_FAMILY" {
  type = string
}

variable "NETWORK_MODE" {
  type = string
}

variable "REQUIRES_COMPATIBILITIES" {
  type = list(string)
}

variable "CPU" {
  type = string
}

variable "MEMORY" {
  type = string
}

variable "EXECUTION_ROLE_ARN" {
  type = string
}

variable "CONTAINER_NAME" {
  type = string
}

variable "CONTAINER_IMAGE" {
  type = string
}

variable "CONTAINER_PORT" {
  type = number
}

variable "ENVIRONMENT_VARIABLES" {
  type = list(object({
    name  = string
    value = string
  }))
}

variable "LOG_GROUP_NAME" {
  type = string
}

variable "REGION" {
  type = string
}

variable "TAGS" {
  type = map(string)
}

variable "ESSENTIAL" {
  type = bool
}