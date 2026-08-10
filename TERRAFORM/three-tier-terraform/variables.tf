variable "REGION" {
  type = string
}

variable "VPC_CIDR_BLOCK" {
  type = string
}

variable "VPC_ENABLE_DNS_HOSTNAMES" {
  type = bool
}

variable "VPC_ENABLE_DNS_SUPPORT" {
  type = bool
}

variable "VPC_NAME" {
  type = string
}

variable "IGW_NAME" {
  type = string
}

variable "PUBLIC_SUBNET_CIDRS" {
  type = list(string)
}

variable "AVAILABILITY_ZONES" {
  type = list(string)
}

variable "APP_SUBNET_CIDRS" {
  type = list(string)
}

variable "DB_SUBNET_CIDRS" {
  type = list(string)
}

variable "PUBLIC_ROUTE_CIDR" {
  type = string
}

variable "PUBLIC_RT_NAME" {
  type = string
}

variable "PRIVATE_ROUTE_CIDR" {
  type = string
}

variable "PRIVATE_RT_NAME" {
  type = string
}

variable "DATABASE_RT_NAME" {
  type = string
}

variable "NAT_GATEWAY_NAME" {
  type = string
}

variable "EIP_NAME" {
  type = string
}

# ALB Variables

variable "ALB_NAME" {
  type = string
}

variable "ALB_INTERNAL" {
  type = bool
}

variable "LOAD_BALANCER_TYPE" {
  type = string
}

variable "ENABLE_DELETION_PROTECTION" {
  type = bool
}

variable "TG_NAME" {
  type = string
}

variable "ALB_PORT" {
  type    = number
  default = 3000
}

variable "PROTOCOL" {
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

# RDS Variables

variable "DB_NAME" {
  type = string
}

variable "DB_USERNAME" {
  type = string
}

variable "DB_PASSWORD" {
  type = string
}

variable "ENGINE" {
  type = string
}

variable "ENGINE_VERSION" {
  type = string
}

variable "INSTANCE_CLASS" {
  type = string
}

variable "ALLOCATED_STORAGE" {
  type = number
}

variable "DB_SUBNET_GROUP_NAME" {
  type = string
}

variable "SKIP_FINAL_SNAPSHOT" {
  type = bool
}

variable "PUBLICLY_ACCESSIBLE" {
  type = bool
}

# EC2 Variables

variable "INSTANCE_TYPE" {
  type = string
}

variable "KEY_NAME" {
  type = string
}

variable "INSTANCE_NAME" {
  type = string
}

variable "TARGET_GROUP_PORT" {
  type = number
}

# Key Pair Variables

variable "ALGORITHM" {
  type = string
}

variable "RSA_BITS" {
  type = number
}

variable "FILENAME" {
  type = string
}

variable "FILE_PERMISSION" {
  type = number
}

variable "DB_SG_NAME" {
  type = string
}

variable "ALB_SG_NAME" {
  type = string
}

variable "APP_SG_NAME" {
  type = string
}

variable "GITHUB_REPO" {
  type = string
}

variable "DB_HOST" {
  type = string
}

variable "DB_USER" {
  type = string
}

variable "IAM_ROLE_NAME" {
  type = string
}

variable "INSTANCE_PROFILE_NAME" {
  type = string
}