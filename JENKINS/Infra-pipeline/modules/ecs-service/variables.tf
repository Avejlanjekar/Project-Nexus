variable "ECS_CLUSTER_ID" {
  type = string
}


# ---------------------------------------------------------
# Task Definitions
# ---------------------------------------------------------

variable "BACKEND_TASK_DEFINITION_ARN" {
  type = string
}

variable "FRONTEND_TASK_DEFINITION_ARN" {
  type = string
}

variable "DATABASE_TASK_DEFINITION_ARN" {
  type = string
}


# ---------------------------------------------------------
# Service Names
# ---------------------------------------------------------

variable "BACKEND_SERVICE_NAME" {
  type = string
}

variable "FRONTEND_SERVICE_NAME" {
  type = string
}

variable "DATABASE_SERVICE_NAME" {
  type = string
}


# ---------------------------------------------------------
# ECS Configuration
# ---------------------------------------------------------

variable "ECS_SERVICE_DESIRED_COUNT" {
  type = number
}

variable "ECS_LAUNCH_TYPE" {
  type = string
}

variable "ECS_ASSIGN_PUBLIC_IP" {
  type = bool
}


# ---------------------------------------------------------
# Networking
# ---------------------------------------------------------

variable "ECS_APP_SUBNET_IDS" {
  type = list(string)
}

variable "ECS_DB_SUBNET_IDS" {
  type = list(string)
}

variable "ECS_SECURITY_GROUP_ID" {
  type = string
}

variable "DB_SECURITY_GROUP_ID" {
  type = string
}


# ---------------------------------------------------------
# Backend Load Balancer
# ---------------------------------------------------------

variable "ENABLE_BACKEND_LOAD_BALANCER" {
  type = bool
}

variable "BACKEND_TARGET_GROUP_ARN" {
  type = string
}

variable "BACKEND_CONTAINER_NAME" {
  type = string
}

variable "BACKEND_CONTAINER_PORT" {
  type = number
}


# ---------------------------------------------------------
# Frontend Load Balancer
# ---------------------------------------------------------

variable "ENABLE_FRONTEND_LOAD_BALANCER" {
  type = bool
}

variable "FRONTEND_TARGET_GROUP_ARN" {
  type = string
}

variable "FRONTEND_CONTAINER_NAME" {
  type = string
}

variable "FRONTEND_CONTAINER_PORT" {
  type = number
}


# ---------------------------------------------------------
# Cloud Map
# ---------------------------------------------------------

variable "BACKEND_CLOUD_MAP_SERVICE_ARN" {
  type = string
}

variable "FRONTEND_CLOUD_MAP_SERVICE_ARN" {
  type = string
}

variable "DATABASE_CLOUD_MAP_SERVICE_ARN" {
  type = string
}


# ---------------------------------------------------------
# Tags
# ---------------------------------------------------------

variable "COMMON_TAGS" {
  type = map(string)
}