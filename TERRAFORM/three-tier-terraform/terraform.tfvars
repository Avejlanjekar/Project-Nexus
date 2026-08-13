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

# ALB & Target Group
ALB_NAME                     = "three-tier-alb"
ALB_INTERNAL                 = false
LOAD_BALANCER_TYPE           = "application"
ENABLE_DELETION_PROTECTION   = false
TG_NAME                      = "Application-TG"
ALB_PORT                     = 80
PROTOCOL                     = "HTTP"
TARGET_TYPE                  = "instance"
HEALTH_CHECK_PATH            = "/"
LISTENER_PORT                = 80
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

# EC2
INSTANCE_TYPE     = "t3.small"
INSTANCE_NAME     = "application-server"
TARGET_GROUP_PORT = 80

# Key Pair
ALGORITHM       = "RSA"
RSA_BITS        = 4096
KEY_NAME        = "three-tier-tf-key"
FILENAME        = "three-tier-key.pem"
FILE_PERMISSION = 400

IAM_ROLE_NAME         = "EC2-SSM-ROLE"
INSTANCE_PROFILE_NAME = "EC2-SSM-PROFILE"

GITHUB_REPO = "https://github.com/Avejlanjekar/Employee_management_system.git"

DB_HOST = "three-tier-db.c9e08egmmmsp.ap-south-1.rds.amazonaws.com"

DB_USER = "Avej"



#sg
ALB_SG_NAME        = "alb-sg"
ALB_SG_PORTS       = [80, 443]
ALB_SG_CIDR_BLOCKS = ["0.0.0.0/0"]


APP_SG_NAME        = "application-sg"
APP_SG_PORTS       = [80]
APP_SG_CIDR_BLOCKS = ["10.0.0.0/16"]


DB_SG_NAME        = "database-sg"
DB_SG_PORTS       = [3306]
DB_SG_CIDR_BLOCKS = ["10.0.0.0/16"]

COMMON_TAGS = {
  Environment = "Development"
  Project     = "Three_Tier_Project"
  Application = "Employee_Management"
  Owner       = "DevOps-Team"
  ManagedBy   = "Terraform"
}