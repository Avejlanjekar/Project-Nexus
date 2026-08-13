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



variable "PROTOCOL" {
  type = string
}

variable "VPC_ID" {
  type = string
}

variable "LISTENER_PORT" {
  type = number
}

variable "LISTENER_DEFAULT_ACTION_TYPE" {
  type = string
}

variable "TARGET_GROUPS" {
  type = map(object({
    name              = string
    port              = number
    protocol          = string
    target_type       = string
    health_check_path = string
  }))
}


variable "DEFAULT_TARGET_GROUP" {
  type = string
}

variable "BACKEND_LISTENER_RULE_PRIORITY" {
  type = number
}

variable "LISTENER_RULE_ACTION_TYPE" {
  type = string
}

variable "LISTENER_RULE_TARGET_GROUP" {
  type = string
}

variable "LISTENER_RULE_PATH_PATTERNS" {
  type = list(string)
}