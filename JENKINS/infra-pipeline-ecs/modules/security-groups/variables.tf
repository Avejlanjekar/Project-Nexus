variable "VPC_ID" {
  description = "ID of the VPC where security groups will be created"
  type        = string
}

variable "ALB_SECURITY_GROUP_NAME" {
  description = "Name of the ALB security group"
  type        = string
}

variable "ALB_INGRESS_RULE" {
  description = "Ingress rule for the ALB security group"

  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}

variable "ALB_EGRESS_RULE" {
  description = "Egress rule for the ALB security group"

  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}

variable "ECS_SECURITY_GROUP_NAME" {
  description = "Name of the ECS security group"
  type        = string
}

variable "ECS_INGRESS_RULES" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}

variable "ECS_EGRESS_RULE" {
  description = "Egress rule for the ECS security group"

  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}

variable "DB_SECURITY_GROUP_NAME" {
  description = "Name of the database security group"
  type        = string
}

variable "DB_INGRESS_RULE" {
  description = "Ingress rule for the database security group"

  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  })
}

variable "DB_EGRESS_RULE" {
  description = "Egress rule for the database security group"

  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}

variable "COMMON_TAGS" {
  description = "Common tags for security groups"
  type        = map(string)
}
