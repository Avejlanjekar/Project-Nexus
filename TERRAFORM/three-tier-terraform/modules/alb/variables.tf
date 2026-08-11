variable "ALB_NAME" {
  type = string
}

variable "ALB_COMMON_TAGS" {
  type = map(string)
}

variable "ALB_INTERNAL" {
  type = bool
}

variable "LOAD_BALANCER_TYPE" {
  type = string
}

variable "ALB_SG" {
  type = string
}

variable "PUBLIC_SUBNET_IDS" {
  type = list(string)
}

variable "ENABLE_DELETION_PROTECTION" {
  type = bool
}

variable "TG_NAME" {
  type = string
}

variable "ALB_PORT" {
  type = number
}

variable "PROTOCOL" {
  type = string
}

variable "VPC_ID" {
  type = string
}


variable "TARGET_TYPE" {
  type = string
}

variable "HEALTH_CHECK_PATH" {
  type = string
}

variable "LISTENER_PORT" {
  type = number
}

variable "LISTENER_DEFAULT_ACTION_TYPE" {
  type = string
}
