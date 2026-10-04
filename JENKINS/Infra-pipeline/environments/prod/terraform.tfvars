VPC_NAME = "app-vpc-prod"

VPC_CIDR_BLOCK = "10.3.0.0/16"

ENABLE_DNS_HOSTNAMES = true
ENABLE_DNS_SUPPORT   = true

VPC_COMMON_TAGS = {
  Environment = "prod"
  Project     = "app"
  ManagedBy   = "Terraform"
}

COMMON_TAGS = {
  Environment = "prod"
  Project     = "app"
  ManagedBy   = "Terraform"
}

IGW_NAME = "app-igw-prod"

PUBLIC_SUBNET_CIDRS = [
  "10.3.1.0/24",
  "10.3.2.0/24"
]

APP_SUBNET_CIDRS = [
  "10.3.11.0/24",
  "10.3.12.0/24"
]

DB_SUBNET_CIDRS = [
  "10.3.21.0/24",
  "10.3.22.0/24"
]

AVAILABILITY_ZONES = [
  "ap-south-1a",
  "ap-south-1b"
]

PUBLIC_SUBNET_NAME = "app-public-subnet-prod"

APP_SUBNET_NAME = "app-private-app-subnet-prod"

DB_SUBNET_NAME = "app-private-db-subnet-prod"

EIP_NAME = "app-nat-eip-prod"

NAT_GATEWAY_NAME = "app-nat-gateway-prod"

PUBLIC_ROUTE_CIDR = "0.0.0.0/0"

PRIVATE_ROUTE_CIDR = "0.0.0.0/0"

PUBLIC_RT_NAME = "app-public-rt-prod"

PRIVATE_RT_NAME = "app-private-rt-prod"

DATABASE_RT_NAME = "app-database-rt-prod"

ALB_SECURITY_GROUP_NAME = "app-alb-sg-prod"

ECS_SECURITY_GROUP_NAME = "app-ecs-sg-prod"

DB_SECURITY_GROUP_NAME = "app-db-sg-prod"

ALB_INGRESS_RULE = {
  description = "Allow HTTP traffic from internet"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

ALB_EGRESS_RULE = {
  description = "Allow outbound traffic"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

ECS_INGRESS_RULES = [
  {
    description = "Allow frontend traffic from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  },
  {
    description = "Allow backend traffic from ALB"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
  }
]

ECS_EGRESS_RULE = {
  description = "Allow outbound traffic"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

DB_INGRESS_RULE = {
  description = "Allow database traffic from ECS"
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
}

DB_EGRESS_RULE = {
  description = "Allow outbound traffic"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

BACKEND_REPOSITORY_NAME  = "app-backend-prod"
FRONTEND_REPOSITORY_NAME = "app-frontend-prod"
DATABASE_REPOSITORY_NAME = "app-database-prod"

IMAGE_TAG_MUTABILITY = "MUTABLE"

SCAN_ON_PUSH = true

ENCRYPTION_TYPE = "AES256"

NAMESPACE_NAME = "app-prod.local"

NAMESPACE_DESCRIPTION = "Private service discovery namespace for app prod environment"

# BACKEND_SERVICE_NAME  = "backend"
# FRONTEND_SERVICE_NAME = "frontend"
# DATABASE_SERVICE_NAME = "database"

DNS_RECORD_TYPE = "A"

DNS_RECORD_TTL = 10

BACKEND_LOG_GROUP_NAME  = "/ecs/app-backend-prod"
FRONTEND_LOG_GROUP_NAME = "/ecs/app-frontend-prod"
DATABASE_LOG_GROUP_NAME = "/ecs/app-database-prod"

LOG_GROUP_RETENTION_DAYS = 7

ALB_NAME               = "app-alb-prod"
ALB_INTERNAL           = false
ALB_LOAD_BALANCER_TYPE = "application"

BACKEND_TARGET_GROUP_NAME     = "app-backend-tg-prod"
BACKEND_TARGET_GROUP_PORT     = 5000
BACKEND_TARGET_GROUP_PROTOCOL = "HTTP"
BACKEND_TARGET_TYPE           = "ip"

BACKEND_HEALTH_CHECK_PATH = "/"
BACKEND_HEALTH_CHECK_PORT = "traffic-port"

FRONTEND_TARGET_GROUP_NAME     = "app-frontend-tg-prod"
FRONTEND_TARGET_GROUP_PORT     = 80
FRONTEND_TARGET_GROUP_PROTOCOL = "HTTP"
FRONTEND_TARGET_TYPE           = "ip"

FRONTEND_HEALTH_CHECK_PATH = "/"
FRONTEND_HEALTH_CHECK_PORT = "traffic-port"

ALB_LISTENER_PORT     = 80
ALB_LISTENER_PROTOCOL = "HTTP"

ECS_CLUSTER_NAME              = "app-ecs-cluster-prod"
ECS_CLUSTER_SETTING_NAME      = "containerInsights"
ECS_CLUSTER_SETTING_VALUE     = "enabled"
ECS_TASK_EXECUTION_ROLE_NAME  = "app-ecs-task-execution-role-prod"
ECS_TASK_EXECUTION_POLICY_ARN = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"

BACKEND_DB_NAME     = "example"
BACKEND_DB_HOST     = "database.app-prod.local"
BACKEND_DB_PORT     = "3306"
BACKEND_DB_USER     = "root"
BACKEND_DB_PASSWORD = "db-57xsl"

DATABASE_NAME          = "example"
DATABASE_ROOT_PASSWORD = "db-57xsl"

FRONTEND_BACKEND_HOST = "backend.app-prod.local"

BACKEND_IMAGE  = "916921211430.dkr.ecr.ap-south-1.amazonaws.com/app-backend-prod:9578a5852da3d8c366b997c894c3c266a1b1ed15"
FRONTEND_IMAGE = "916921211430.dkr.ecr.ap-south-1.amazonaws.com/app-frontend-prod:9578a5852da3d8c366b997c894c3c266a1b1ed15"
DATABASE_IMAGE = "916921211430.dkr.ecr.ap-south-1.amazonaws.com/app-database-prod:9578a5852da3d8c366b997c894c3c266a1b1ed15"

ECS_TASK_CPU = "256"

ECS_TASK_MEMORY = "512"

ECS_NETWORK_MODE = "awsvpc"

ECS_REQUIRES_COMPATIBILITIES = [
  "FARGATE"
]

BACKEND_CONTAINER_PORT  = 5000
FRONTEND_CONTAINER_PORT = 80
DATABASE_CONTAINER_PORT = 3306

BACKEND_CONTAINER_NAME  = "backend"
FRONTEND_CONTAINER_NAME = "frontend"
DATABASE_CONTAINER_NAME = "database"

AWS_REGION = "ap-south-1"

# ---------------------------------------------------------
# Task Definition Families
# ---------------------------------------------------------

BACKEND_TASK_DEFINITION_FAMILY  = "app-backend-prod"
FRONTEND_TASK_DEFINITION_FAMILY = "app-frontend-prod"
DATABASE_TASK_DEFINITION_FAMILY = "app-database-prod"

# ---------------------------------------------------------
# ECS Services
# ---------------------------------------------------------

BACKEND_SERVICE_NAME  = "app-backend-service-prod"
FRONTEND_SERVICE_NAME = "app-frontend-service-prod"
DATABASE_SERVICE_NAME = "app-database-service-prod"

BACKEND_CM_SERVICE_NAME   = "backend"
FRONTEND_CM__SERVICE_NAME = "frontend"
DATABASE_CM_SERVICE_NAME  = "database"

ECS_SERVICE_DESIRED_COUNT = 1

ECS_LAUNCH_TYPE = "FARGATE"

ECS_ASSIGN_PUBLIC_IP = false

ENABLE_BACKEND_LOAD_BALANCER  = true
ENABLE_FRONTEND_LOAD_BALANCER = true