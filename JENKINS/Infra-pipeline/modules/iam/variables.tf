variable "ECS_TASK_EXECUTION_ROLE_NAME" {
  description = "Name of the ECS task execution IAM role"
  type        = string
}

variable "ECS_TASK_EXECUTION_POLICY_ARN" {
  description = "ARN of the managed policy attached to the ECS task execution role"
  type        = string
}

variable "COMMON_TAGS" {
  description = "Common tags for IAM resources"
  type        = map(string)
}