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

# # ALB Variables

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



variable "PROTOCOL" {
  type = string
}


variable "LISTENER_PORT" {
  type = number
}

variable "LISTENER_DEFAULT_ACTION_TYPE" {
  type = string
}

# # RDS Variables

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

# #sg
variable "ALB_SG_NAME" {
  type = string
}


variable "ALB_INGRESS_PORTS" {
  type = list(number)
}

variable "ALB_INGRESS_CIDR_BLOCKS" {
  type = list(string)
}

variable "ALB_EGRESS_PORTS" {
  type = list(number)
}

variable "ALB_EGRESS_CIDR_BLOCKS" {
  type = list(string)
}

variable "DB_SG_NAME" {
  type = string
}

variable "COMMON_TAGS" {
  type = map(string)
}


variable "BACKEND_SG_NAME" {
  type = string
}

#ECR Frontend
variable "FRONTEND_ECR_NAME" {
  type = string
}


variable "FRONTEND_IMAGE_TAG_MUTABILITY" {
  type = string
}

variable "SCAN_ON_PUSH" {
  type    = bool
  default = true
}

#ECR BACKEND
variable "BACKEND_ECR_NAME" {
  type = string
}

variable "BACKEND_IMAGE_TAG_MUTABILITY" {
  type = string
}

#ecs
variable "ECS_CLUSTER_NAME" {
  type = string
}

variable "ECS_TASK_EXECUTION_ROLE_NAME" {
  type = string
}

#cloudwatch
variable "BACKEND_LOG_GROUP_NAME" {
  type = string
}

variable "RETENTION_IN_DAYS" {
  type = number
}

variable "FRONTEND_LOG_GROUP_NAME" {
  type = string
}

# td
variable "BACKEND_TASK_FAMILY" {
  type = string
}

variable "NETWORK_MODE" {
  type = string
}

variable "REQUIRES_COMPATIBILITIES" {
  type = list(string)
}

variable "BACKEND_CPU" {
  type = string
}

variable "BACKEND_MEMORY" {
  type = string
}

variable "BACKEND_CONTAINER_NAME" {
  type = string
}

variable "BACKEND_CONTAINER_PORT" {
  type = number
}

variable "ESSENTIAL" {
  type = bool
}

variable "BACKEND_ENVIRONMENT_VARIABLES" {
  type = list(object({
    name  = string
    value = string
  }))
}

variable "BACKEND_SERVICE_NAME" {
  type = string
}

variable "BACKEND_DESIRED_COUNT" {
  type = number
}

variable "BACKEND_ASSIGN_PUBLIC_IP" {
  type = bool
}


variable "BACKEND_INGRESS_PORTS" {
  type = list(number)
}

variable "BACKEND_INGRESS_CIDR_BLOCKS" {
  type = list(string)
}

variable "BACKEND_EGRESS_PORTS" {
  type = list(number)
}

variable "BACKEND_EGRESS_CIDR_BLOCKS" {
  type = list(string)
}

variable "DB_INGRESS_PORTS" {
  type = list(number)
}

variable "DB_INGRESS_CIDR_BLOCKS" {
  type = list(string)
}

variable "DB_EGRESS_PORTS" {
  type = list(number)
}

variable "DB_EGRESS_CIDR_BLOCKS" {
  type = list(string)
}

variable "FRONTEND_TASK_FAMILY" {
  type = string
}

variable "FRONTEND_CPU" {
  type = number
}

variable "FRONTEND_MEMORY" {
  type = number
}

variable "FRONTEND_CONTAINER_NAME" {
  type = string
}

variable "FRONTEND_CONTAINER_PORT" {
  type = number
}

variable "FRONTEND_TG_NAME" {
  type = string
}

variable "FRONTEND_ALB_PORT" {
  type = number
}

variable "FRONTEND_HEALTH_CHECK_PATH" {
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

variable "FRONTEND_SG_NAME" {
  type = string
}

variable "FRONTEND_INGRESS_PORTS" {
  type = list(number)
}

variable "FRONTEND_INGRESS_CIDR_BLOCKS" {
  type = list(string)
}

variable "FRONTEND_EGRESS_PORTS" {
  type = list(number)
}

variable "FRONTEND_EGRESS_CIDR_BLOCKS" {
  type = list(string)
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

variable "FRONTEND_SERVICE_NAME" {
  type = string
}

variable "FRONTEND_DESIRED_COUNT" {
  type = number
}

variable "FRONTEND_ASSIGN_PUBLIC_IP" {
  type = bool
}

variable "DB_HOST" {
  type = string
}