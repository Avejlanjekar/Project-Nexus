variable "VPC_NAME" {
  description = "Name of the VPC"
  type        = string
}

variable "VPC_CIDR_BLOCK" {
  description = "CIDR block of the VPC"
  type        = string
}

variable "ENABLE_DNS_HOSTNAMES" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
}

variable "ENABLE_DNS_SUPPORT" {
  description = "Enable DNS support in the VPC"
  type        = bool
}

variable "VPC_COMMON_TAGS" {
  description = "Common tags for the VPC"
  type        = map(string)
}

variable "COMMON_TAGS" {
  description = "Common tags for the VPC"
  type        = map(string)
}

variable "IGW_NAME" {
  description = "Name of the Internet Gateway"
  type        = string
}

variable "PUBLIC_SUBNET_CIDRS" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "APP_SUBNET_CIDRS" {
  description = "CIDR blocks for application subnets"
  type        = list(string)
}

variable "DB_SUBNET_CIDRS" {
  description = "CIDR blocks for database subnets"
  type        = list(string)
}

variable "AVAILABILITY_ZONES" {
  description = "Availability zones for the subnets"
  type        = list(string)
}

variable "PUBLIC_SUBNET_NAME" {
  description = "Base name of public subnets"
  type        = string
}

variable "APP_SUBNET_NAME" {
  description = "Base name of application subnets"
  type        = string
}

variable "DB_SUBNET_NAME" {
  description = "Base name of database subnets"
  type        = string
}

variable "EIP_NAME" {
  description = "Name of the NAT Gateway Elastic IP"
  type        = string
}

variable "NAT_GATEWAY_NAME" {
  description = "Name of the NAT Gateway"
  type        = string
}

variable "PUBLIC_ROUTE_CIDR" {
  description = "Destination CIDR for the public route"
  type        = string
}

variable "PRIVATE_ROUTE_CIDR" {
  description = "Destination CIDR for the private route"
  type        = string
}

variable "PUBLIC_RT_NAME" {
  description = "Name of the public route table"
  type        = string
}

variable "PRIVATE_RT_NAME" {
  description = "Name of the private route table"
  type        = string
}

variable "DATABASE_RT_NAME" {
  description = "Name of the database route table"
  type        = string
}

variable "ALB_SECURITY_GROUP_NAME" {
  description = "Name of the ALB security group"
  type        = string
}

variable "ECS_SECURITY_GROUP_NAME" {
  description = "Name of the ECS security group"
  type        = string
}

variable "DB_SECURITY_GROUP_NAME" {
  description = "Name of the database security group"
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

variable "BACKEND_REPOSITORY_NAME" {
  description = "Name of the backend ECR repository"
  type        = string
}

variable "FRONTEND_REPOSITORY_NAME" {
  description = "Name of the frontend ECR repository"
  type        = string
}

variable "DATABASE_REPOSITORY_NAME" {
  description = "Name of the database ECR repository"
  type        = string
}

variable "IMAGE_TAG_MUTABILITY" {
  description = "Image tag mutability setting"
  type        = string
}

variable "SCAN_ON_PUSH" {
  description = "Enable ECR image scanning on push"
  type        = bool
}

variable "ENCRYPTION_TYPE" {
  description = "ECR repository encryption type"
  type        = string
}

variable "NAMESPACE_NAME" {
  description = "Cloud Map private DNS namespace name"
  type        = string
}

variable "NAMESPACE_DESCRIPTION" {
  description = "Cloud Map namespace description"
  type        = string
}


variable "DNS_RECORD_TYPE" {
  description = "Cloud Map DNS record type"
  type        = string
}

variable "DNS_RECORD_TTL" {
  description = "Cloud Map DNS record TTL"
  type        = number
}

variable "ECS_CLUSTER_NAME" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ECS_CLUSTER_SETTING_NAME" {
  description = "Name of the ECS cluster setting"
  type        = string
}

variable "ECS_CLUSTER_SETTING_VALUE" {
  description = "Value of the ECS cluster setting"
  type        = string
}

variable "ECS_TASK_EXECUTION_ROLE_NAME" {
  description = "Name of the ECS task execution role"
  type        = string
}

variable "ECS_TASK_EXECUTION_POLICY_ARN" {
  description = "ARN of the ECS task execution managed policy"
  type        = string
}


variable "LOG_GROUP_RETENTION_DAYS" {
  description = "Number of days CloudWatch logs should be retained"
  type        = number
}

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

variable "ALB_LISTENER_PORT" {
  description = "Port on which the ALB listener accepts traffic"
  type        = number
}

variable "ALB_LISTENER_PROTOCOL" {
  description = "Protocol used by the ALB listener"
  type        = string
}
# ---------------------------------------------------------
# ECS Task Definitions
# ---------------------------------------------------------

variable "BACKEND_TASK_DEFINITION_FAMILY" {
  description = "Family name of the backend ECS task definition"
  type        = string
}

variable "FRONTEND_TASK_DEFINITION_FAMILY" {
  description = "Family name of the frontend ECS task definition"
  type        = string
}

variable "DATABASE_TASK_DEFINITION_FAMILY" {
  description = "Family name of the database ECS task definition"
  type        = string
}


# ---------------------------------------------------------
# ECS Container Names
# ---------------------------------------------------------

variable "BACKEND_CONTAINER_NAME" {
  description = "Name of the backend ECS container"
  type        = string
}

variable "FRONTEND_CONTAINER_NAME" {
  description = "Name of the frontend ECS container"
  type        = string
}

variable "DATABASE_CONTAINER_NAME" {
  description = "Name of the database ECS container"
  type        = string
}


# ---------------------------------------------------------
# ECS Container Images
# ---------------------------------------------------------

variable "BACKEND_IMAGE" {
  description = "Initial backend ECR image URI"
  type        = string
}

variable "FRONTEND_IMAGE" {
  description = "Initial frontend ECR image URI"
  type        = string
}

variable "DATABASE_IMAGE" {
  description = "Initial database ECR image URI"
  type        = string
}


# ---------------------------------------------------------
# ECS Fargate Configuration
# ---------------------------------------------------------

variable "ECS_TASK_CPU" {
  description = "CPU units allocated to the ECS Fargate task"
  type        = string
}

variable "ECS_TASK_MEMORY" {
  description = "Memory allocated to the ECS Fargate task"
  type        = string
}

variable "ECS_NETWORK_MODE" {
  description = "Network mode used by ECS tasks"
  type        = string
}

variable "ECS_REQUIRES_COMPATIBILITIES" {
  description = "ECS launch compatibility"
  type        = list(string)
}


# ---------------------------------------------------------
# ECS Container Ports
# ---------------------------------------------------------

variable "BACKEND_CONTAINER_PORT" {
  description = "Port exposed by the backend container"
  type        = number
}

variable "FRONTEND_CONTAINER_PORT" {
  description = "Port exposed by the frontend container"
  type        = number
}

variable "DATABASE_CONTAINER_PORT" {
  description = "Port exposed by the database container"
  type        = number
}


# ---------------------------------------------------------
# Backend Database Configuration
# ---------------------------------------------------------

variable "BACKEND_DB_NAME" {
  description = "Database name used by the backend"
  type        = string
}

variable "BACKEND_DB_HOST" {
  description = "Database hostname used by the backend"
  type        = string
}

variable "BACKEND_DB_PORT" {
  description = "Database port used by the backend"
  type        = string
}

variable "BACKEND_DB_USER" {
  description = "Database username used by the backend"
  type        = string
}

variable "BACKEND_DB_PASSWORD" {
  description = "Database password used by the backend"
  type        = string
  sensitive   = true
}


# ---------------------------------------------------------
# Database Configuration
# ---------------------------------------------------------

variable "DATABASE_NAME" {
  description = "MySQL database name"
  type        = string
}

variable "DATABASE_ROOT_PASSWORD" {
  description = "MySQL root password"
  type        = string
  sensitive   = true
}


# ---------------------------------------------------------
# Frontend Configuration
# ---------------------------------------------------------

variable "FRONTEND_BACKEND_HOST" {
  description = "Backend hostname used by the frontend"
  type        = string
}


# ---------------------------------------------------------
# CloudWatch Logs
# ---------------------------------------------------------

variable "BACKEND_LOG_GROUP_NAME" {
  description = "CloudWatch log group for backend"
  type        = string
}

variable "FRONTEND_LOG_GROUP_NAME" {
  description = "CloudWatch log group for frontend"
  type        = string
}

variable "DATABASE_LOG_GROUP_NAME" {
  description = "CloudWatch log group for database"
  type        = string
}

variable "AWS_REGION" {
  description = "AWS region used by ECS logging"
  type        = string
}

# ---------------------------------------------------------
# ECS Services
# ---------------------------------------------------------

variable "BACKEND_SERVICE_NAME" {
  description = "Name of the backend ECS service"
  type        = string
}

variable "FRONTEND_SERVICE_NAME" {
  description = "Name of the frontend ECS service"
  type        = string
}

variable "DATABASE_SERVICE_NAME" {
  description = "Name of the database ECS service"
  type        = string
}

variable "ECS_SERVICE_DESIRED_COUNT" {
  description = "Desired number of ECS tasks for each service"
  type        = number
}

variable "ECS_LAUNCH_TYPE" {
  description = "ECS service launch type"
  type        = string
}

variable "ECS_ASSIGN_PUBLIC_IP" {
  description = "Whether ECS tasks receive public IP addresses"
  type        = bool
}

variable "ENABLE_BACKEND_LOAD_BALANCER" {
  description = "Whether backend service uses the ALB"
  type        = bool
}

variable "ENABLE_FRONTEND_LOAD_BALANCER" {
  description = "Whether frontend service uses the ALB"
  type        = bool
}

variable "BACKEND_CM_SERVICE_NAME" {
  type = string
}

variable "FRONTEND_CM__SERVICE_NAME" {
  type = string
}

variable "DATABASE_CM_SERVICE_NAME" {
  type = string
}
