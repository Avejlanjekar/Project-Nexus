variable "SERVICE_NAME" {
  type = string
}

variable "CLUSTER_ARN" {
  type = string
}

variable "TASK_DEFINITION_ARN" {
  type = string
}

variable "DESIRED_COUNT" {
  type = number
}

variable "SUBNET_IDS" {
  type = list(string)
}

variable "SECURITY_GROUP_IDS" {
  type = list(string)
}

variable "ASSIGN_PUBLIC_IP" {
  type = bool
}

variable "TAGS" {
  type = map(string)
}

variable "TARGET_GROUP_ARN" {
  type = string
}

variable "CONTAINER_NAME" {
  type = string
}

variable "CONTAINER_PORT" {
  type = number
}