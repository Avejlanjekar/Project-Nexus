REGION                   = "ap-south-1"
VPC_CIDR_BLOCK           = "10.0.0.0/16"
VPC_ENABLE_DNS_HOSTNAMES = true
VPC_ENABLE_DNS_SUPPORT   = true
VPC_NAME                 = "cloudethix-vpc"
IGW_NAME                 = "cloudethix-Internet-Gateway"
PUBLIC_SUBNET_CIDRS      = ["10.0.1.0/24", "10.0.2.0/24"]
AVAILABILITY_ZONES       = ["ap-south-1a", "ap-south-1b"]
APP_SUBNET_CIDRS         = ["10.0.3.0/24", "10.0.4.0/24"]
DB_SUBNET_CIDRS          = ["10.0.5.0/24", "10.0.6.0/24"]
PUBLIC_ROUTE_CIDR        = "0.0.0.0/0"
PUBLIC_RT_NAME           = "public-rt"
PRIVATE_ROUTE_CIDR       = "0.0.0.0/0"
PRIVATE_RT_NAME          = "private-rt"
DATABASE_RT_NAME         = "Database-rt"
EIP_NAME                 = "nat-eip"
NAT_GATEWAY_NAME         = "three_tier_nat"

# # ALB & Target Group

ALB_NAME = "employee-frontend-alb"

ALB_INTERNAL = false

LOAD_BALANCER_TYPE = "application"

ENABLE_DELETION_PROTECTION = false

PROTOCOL = "HTTP"

LISTENER_PORT = 80

LISTENER_DEFAULT_ACTION_TYPE = "forward"


# RDS
DB_NAME              = "cloudethix"
DB_USERNAME          = "Avej"
DB_PASSWORD          = "Avej1234"
ENGINE               = "mysql"
ENGINE_VERSION       = "8.0"
INSTANCE_CLASS       = "db.t3.micro"
ALLOCATED_STORAGE    = 20
SKIP_FINAL_SNAPSHOT  = true
PUBLICLY_ACCESSIBLE  = false
DB_SUBNET_GROUP_NAME = "three-tier-db-subnet-group"

# #sg
ALB_SG_NAME = "employee-alb-sg"

ALB_INGRESS_PORTS = [80]

ALB_INGRESS_CIDR_BLOCKS = [
  "0.0.0.0/0"
]

ALB_EGRESS_PORTS = [80, 5000]

ALB_EGRESS_CIDR_BLOCKS = [
  "10.0.0.0/16"
]

DB_SG_NAME             = "database-sg"
DB_INGRESS_PORTS       = [3306]
DB_INGRESS_CIDR_BLOCKS = ["10.0.0.0/16"]

DB_EGRESS_PORTS       = [3306]
DB_EGRESS_CIDR_BLOCKS = ["10.0.0.0/16"]

BACKEND_SG_NAME             = "backend-sg"
BACKEND_INGRESS_PORTS       = [5000]
BACKEND_INGRESS_CIDR_BLOCKS = ["10.0.0.0/16"]
BACKEND_EGRESS_PORTS        = [443, 3306]
BACKEND_EGRESS_CIDR_BLOCKS  = ["0.0.0.0/0"]

FRONTEND_SG_NAME = "employee-frontend-sg"

FRONTEND_INGRESS_PORTS = [
  80
]
FRONTEND_INGRESS_CIDR_BLOCKS = [
  "10.0.0.0/16"
]
FRONTEND_EGRESS_PORTS = [
  443
]
FRONTEND_EGRESS_CIDR_BLOCKS = [
  "0.0.0.0/0"
]

COMMON_TAGS = {
  Environment = "Development"
  Project     = "Three_Tier_Project"
  Application = "Employee_Management"
  Owner       = "DevOps-Team"
  ManagedBy   = "Terraform"
}


FRONTEND_ECR_NAME = "employee-frontend"

BACKEND_ECR_NAME              = "employee-backend"
BACKEND_IMAGE_TAG_MUTABILITY  = "MUTABLE"
FRONTEND_IMAGE_TAG_MUTABILITY = "MUTABLE"
SCAN_ON_PUSH                  = true
ECS_CLUSTER_NAME              = "Employee_management_cluster"
ECS_TASK_EXECUTION_ROLE_NAME  = "Employee-ECS-Task-Execution-Role"

BACKEND_LOG_GROUP_NAME  = "/ecs/employee-backend"
RETENTION_IN_DAYS       = 7
FRONTEND_LOG_GROUP_NAME = "/ecs/employee-frontend"

#td
BACKEND_TASK_FAMILY = "employee-backend"

NETWORK_MODE = "awsvpc"

REQUIRES_COMPATIBILITIES = [
  "FARGATE"
]

BACKEND_CPU    = "256"
BACKEND_MEMORY = "512"

BACKEND_CONTAINER_NAME = "employee-backend"
BACKEND_CONTAINER_PORT = 5000
BACKEND_ENVIRONMENT_VARIABLES = [
  {
    name  = "DB_USER"
    value = "Avej"
  },
  {
    name  = "DB_PASSWORD"
    value = "Avej1234"
  },
  {
    name  = "DB_NAME"
    value = "cloudethix"
  },
  {
    name  = "PORT"
    value = "5000"
  },
  {
    name  = "DB_PORT"
    value = "3306"
  }

]
DB_HOST   = "DB_HOST"
ESSENTIAL = true


BACKEND_SERVICE_NAME     = "employee-backend-service"
BACKEND_DESIRED_COUNT    = 1
BACKEND_ASSIGN_PUBLIC_IP = false

FRONTEND_SERVICE_NAME     = "employee-frontend-service"
FRONTEND_DESIRED_COUNT    = 1
FRONTEND_ASSIGN_PUBLIC_IP = false

FRONTEND_TASK_FAMILY    = "employee-frontend"
FRONTEND_CPU            = 256
FRONTEND_MEMORY         = 512
FRONTEND_CONTAINER_NAME = "employee-frontend"
FRONTEND_CONTAINER_PORT = 80

FRONTEND_TG_NAME           = "employee-frontend-tg"
FRONTEND_ALB_PORT          = 80
FRONTEND_HEALTH_CHECK_PATH = "/"

TARGET_GROUPS = {
  backend = {
    name              = "employee-backend-tg"
    port              = 5000
    protocol          = "HTTP"
    target_type       = "ip"
    health_check_path = "/api/employees"
  }

  frontend = {
    name              = "employee-frontend-tg"
    port              = 80
    protocol          = "HTTP"
    target_type       = "ip"
    health_check_path = "/"
  }
}

DEFAULT_TARGET_GROUP = "frontend"

BACKEND_LISTENER_RULE_PRIORITY = 100

LISTENER_RULE_ACTION_TYPE = "forward"

LISTENER_RULE_TARGET_GROUP = "backend"

LISTENER_RULE_PATH_PATTERNS = [
  "/api/*"
]