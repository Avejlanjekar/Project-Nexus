variable "ALB_NAME" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "ALB_INTERNAL" {
  description = "Whether the ALB is internal"
  type        = bool
}

variable "ALB_LOAD_BALANCER_TYPE" {
  description = "Type of the load balancer"
  type        = string
}

variable "ALB_SUBNET_IDS" {
  description = "Subnet IDs where the ALB will be deployed"
  type        = list(string)
}

variable "ALB_SECURITY_GROUP_ID" {
  description = "Security group ID attached to the ALB"
  type        = string
}

variable "BACKEND_TARGET_GROUP_NAME" {
  description = "Name of the backend ALB target group"
  type        = string
}

variable "BACKEND_TARGET_GROUP_PORT" {
  description = "Port on which the backend application listens"
  type        = number
}

variable "BACKEND_TARGET_GROUP_PROTOCOL" {
  description = "Protocol used by the backend target group"
  type        = string
}

variable "BACKEND_TARGET_TYPE" {
  description = "Target type for the backend target group"
  type        = string
}

variable "BACKEND_HEALTH_CHECK_PATH" {
  description = "Health check path for the backend target group"
  type        = string
}

variable "BACKEND_HEALTH_CHECK_PORT" {
  description = "Health check port for the backend target group"
  type        = string
}

variable "ALB_LISTENER_PORT" {
  description = "Port on which the ALB listener accepts traffic"
  type        = number
}

variable "ALB_LISTENER_PROTOCOL" {
  description = "Protocol used by the ALB listener"
  type        = string
}

variable "VPC_ID" {
  description = "ID of the VPC where the target group is created"
  type        = string
}

variable "COMMON_TAGS" {
  description = "Common tags for ALB resources"
  type        = map(string)
}

variable "FRONTEND_TARGET_GROUP_NAME" {
  description = "Name of the frontend ALB target group"
  type        = string
}

variable "FRONTEND_TARGET_GROUP_PORT" {
  description = "Port on which the frontend application listens"
  type        = number
}

variable "FRONTEND_TARGET_GROUP_PROTOCOL" {
  description = "Protocol used by the frontend target group"
  type        = string
}

variable "FRONTEND_TARGET_TYPE" {
  description = "Target type for the frontend target group"
  type        = string
}

variable "FRONTEND_HEALTH_CHECK_PATH" {
  description = "Health check path for the frontend target group"
  type        = string
}

variable "FRONTEND_HEALTH_CHECK_PORT" {
  description = "Health check port for the frontend target group"
  type        = string
}