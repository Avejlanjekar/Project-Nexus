module "networking" {
  source               = "./modules/networking"
  VPC_CIDR_BLOCK       = var.VPC_CIDR_BLOCK
  ENABLE_DNS_HOSTNAMES = var.VPC_ENABLE_DNS_HOSTNAMES
  ENABLE_DNS_SUPPORT   = var.VPC_ENABLE_DNS_SUPPORT
  VPC_NAME             = var.VPC_NAME
  IGW_NAME             = var.IGW_NAME
  PUBLIC_SUBNET_CIDRS  = var.PUBLIC_SUBNET_CIDRS
  AVAILABILITY_ZONES   = var.AVAILABILITY_ZONES
  APP_SUBNET_CIDRS     = var.APP_SUBNET_CIDRS
  DB_SUBNET_CIDRS      = var.DB_SUBNET_CIDRS
  PUBLIC_ROUTE_CIDR    = var.PUBLIC_ROUTE_CIDR
  PUBLIC_RT_NAME       = var.PUBLIC_RT_NAME
  PRIVATE_ROUTE_CIDR   = var.PRIVATE_ROUTE_CIDR
  PRIVATE_RT_NAME      = var.PRIVATE_RT_NAME
  DATABASE_RT_NAME     = var.DATABASE_RT_NAME
  NAT_GATEWAY_NAME     = var.NAT_GATEWAY_NAME
  EIP_NAME             = var.EIP_NAME
  VPC_COMMON_TAGS      = var.COMMON_TAGS
}

module "db_security_group" {
  source              = "./modules/security-group"
  VPC_ID              = module.networking.VPC_ID
  SG_NAME             = var.DB_SG_NAME
  INGRESS_PORTS       = var.DB_INGRESS_PORTS
  INGRESS_CIDR_BLOCKS = var.DB_INGRESS_CIDR_BLOCKS
  EGRESS_PORTS        = var.DB_EGRESS_PORTS
  EGRESS_CIDR_BLOCKS  = var.DB_EGRESS_CIDR_BLOCKS
}

module "backend_security_group" {
  source              = "./modules/security-group"
  VPC_ID              = module.networking.VPC_ID
  SG_NAME             = var.BACKEND_SG_NAME
  INGRESS_PORTS       = var.BACKEND_INGRESS_PORTS
  INGRESS_CIDR_BLOCKS = var.BACKEND_INGRESS_CIDR_BLOCKS
  EGRESS_PORTS        = var.BACKEND_EGRESS_PORTS
  EGRESS_CIDR_BLOCKS  = var.BACKEND_EGRESS_CIDR_BLOCKS
}

module "frontend_security_group" {
  source              = "./modules/security-group"
  VPC_ID              = module.networking.VPC_ID
  SG_NAME             = var.FRONTEND_SG_NAME
  INGRESS_PORTS       = var.FRONTEND_INGRESS_PORTS
  INGRESS_CIDR_BLOCKS = var.FRONTEND_INGRESS_CIDR_BLOCKS
  EGRESS_PORTS        = var.FRONTEND_EGRESS_PORTS
  EGRESS_CIDR_BLOCKS  = var.FRONTEND_EGRESS_CIDR_BLOCKS
}

module "rds" {
  source               = "./modules/rds"
  DB_SUBNET_IDS        = module.networking.PRIVATE_DB_SUBNET_IDS
  DB_SG_ID             = module.db_security_group.security_group_id
  DB_NAME              = var.DB_NAME
  USERNAME             = var.DB_USERNAME
  PASSWORD             = var.DB_PASSWORD
  ENGINE               = var.ENGINE
  ENGINE_VERSION       = var.ENGINE_VERSION
  INSTANCE_CLASS       = var.INSTANCE_CLASS
  ALLOCATED_STORAGE    = var.ALLOCATED_STORAGE
  PUBLICLY_ACCESSIBLE  = var.PUBLICLY_ACCESSIBLE
  SKIP_FINAL_SNAPSHOT  = var.SKIP_FINAL_SNAPSHOT
  DB_SUBNET_GROUP_NAME = var.DB_SUBNET_GROUP_NAME
  DB_COMMON_TAGS       = var.COMMON_TAGS
}

module "alb_security_group" {
  source              = "./modules/security-group"
  VPC_ID              = module.networking.VPC_ID
  SG_NAME             = var.ALB_SG_NAME
  INGRESS_PORTS       = var.ALB_INGRESS_PORTS
  INGRESS_CIDR_BLOCKS = var.ALB_INGRESS_CIDR_BLOCKS
  EGRESS_PORTS        = var.ALB_EGRESS_PORTS
  EGRESS_CIDR_BLOCKS  = var.ALB_EGRESS_CIDR_BLOCKS
}

module "alb" {
  source                         = "./modules/alb"
  VPC_ID                         = module.networking.VPC_ID
  PUBLIC_SUBNET_IDS              = module.networking.PUBLIC_SUBNET_IDS
  ALB_SG                         = module.alb_security_group.security_group_id
  ALB_NAME                       = var.ALB_NAME
  ALB_INTERNAL                   = var.ALB_INTERNAL
  LOAD_BALANCER_TYPE             = var.LOAD_BALANCER_TYPE
  ENABLE_DELETION_PROTECTION     = var.ENABLE_DELETION_PROTECTION
  TARGET_GROUPS                  = var.TARGET_GROUPS
  PROTOCOL                       = var.PROTOCOL
  LISTENER_PORT                  = var.LISTENER_PORT
  LISTENER_DEFAULT_ACTION_TYPE   = var.LISTENER_DEFAULT_ACTION_TYPE
  DEFAULT_TARGET_GROUP           = var.DEFAULT_TARGET_GROUP
  BACKEND_LISTENER_RULE_PRIORITY = var.BACKEND_LISTENER_RULE_PRIORITY
  LISTENER_RULE_ACTION_TYPE      = var.LISTENER_RULE_ACTION_TYPE
  LISTENER_RULE_TARGET_GROUP     = var.LISTENER_RULE_TARGET_GROUP
  LISTENER_RULE_PATH_PATTERNS    = var.LISTENER_RULE_PATH_PATTERNS
  ALB_COMMON_TAGS                = var.COMMON_TAGS
}

module "frontend_ecr" {
  source               = "./modules/ecr"
  REPOSITORY_NAME      = var.FRONTEND_ECR_NAME
  COMMON_TAGS          = var.COMMON_TAGS
  IMAGE_TAG_MUTABILITY = var.FRONTEND_IMAGE_TAG_MUTABILITY
  SCAN_ON_PUSH         = var.SCAN_ON_PUSH
}

module "backend_ecr" {
  source               = "./modules/ecr"
  REPOSITORY_NAME      = var.BACKEND_ECR_NAME
  COMMON_TAGS          = var.COMMON_TAGS
  IMAGE_TAG_MUTABILITY = var.BACKEND_IMAGE_TAG_MUTABILITY
  SCAN_ON_PUSH         = var.SCAN_ON_PUSH
}

module "ecs_cluster" {
  source       = "./modules/ecs"
  CLUSTER_NAME = var.ECS_CLUSTER_NAME
  COMMON_TAGS  = var.COMMON_TAGS
}

module "iam" {
  source        = "./modules/iam"
  IAM_ROLE_NAME = var.ECS_TASK_EXECUTION_ROLE_NAME
  TAGS          = var.COMMON_TAGS
}

module "backend_cloudwatch" {
  source            = "./modules/cloudwatch"
  LOG_GROUP_NAME    = var.BACKEND_LOG_GROUP_NAME
  RETENTION_IN_DAYS = var.RETENTION_IN_DAYS
  TAGS              = var.COMMON_TAGS
}

module "frontend_cloudwatch" {
  source            = "./modules/cloudwatch"
  LOG_GROUP_NAME    = var.FRONTEND_LOG_GROUP_NAME
  RETENTION_IN_DAYS = var.RETENTION_IN_DAYS
  TAGS              = var.COMMON_TAGS
}

module "backend_task_definition" {
  source                   = "./modules/task-definition"
  TASK_FAMILY              = var.BACKEND_TASK_FAMILY
  NETWORK_MODE             = var.NETWORK_MODE
  REQUIRES_COMPATIBILITIES = var.REQUIRES_COMPATIBILITIES
  CPU                      = var.BACKEND_CPU
  MEMORY                   = var.BACKEND_MEMORY
  EXECUTION_ROLE_ARN       = module.iam.ecs_task_execution_role_arn
  CONTAINER_NAME           = var.BACKEND_CONTAINER_NAME
  CONTAINER_IMAGE          = "${module.backend_ecr.Repository_url}:latest"
  CONTAINER_PORT           = var.BACKEND_CONTAINER_PORT
  ENVIRONMENT_VARIABLES = concat(
    var.BACKEND_ENVIRONMENT_VARIABLES,
    [
      {
        name  = var.DB_HOST
        value = module.rds.DB_ENDPOINT
      }
    ]
  )
  LOG_GROUP_NAME = module.backend_cloudwatch.log_group_name
  REGION         = var.REGION
  TAGS           = var.COMMON_TAGS
  ESSENTIAL      = var.ESSENTIAL
}

module "frontend_task_definition" {
  source                   = "./modules/task-definition"
  TASK_FAMILY              = var.FRONTEND_TASK_FAMILY
  NETWORK_MODE             = var.NETWORK_MODE
  REQUIRES_COMPATIBILITIES = var.REQUIRES_COMPATIBILITIES
  CPU                      = var.FRONTEND_CPU
  MEMORY                   = var.FRONTEND_MEMORY
  EXECUTION_ROLE_ARN       = module.iam.ecs_task_execution_role_arn
  CONTAINER_NAME           = var.FRONTEND_CONTAINER_NAME
  CONTAINER_IMAGE          = "${module.frontend_ecr.Repository_url}:latest"
  CONTAINER_PORT           = var.FRONTEND_CONTAINER_PORT
  ENVIRONMENT_VARIABLES    = []
  LOG_GROUP_NAME           = module.frontend_cloudwatch.log_group_name
  REGION                   = var.REGION
  TAGS                     = var.COMMON_TAGS
  ESSENTIAL                = var.ESSENTIAL
}

module "backend_ecs_service" {
  source              = "./modules/ecs-service"
  SERVICE_NAME        = var.BACKEND_SERVICE_NAME
  CLUSTER_ARN         = module.ecs_cluster.cluster_arn
  TASK_DEFINITION_ARN = module.backend_task_definition.TASK_DEFINITION_ARN
  DESIRED_COUNT       = var.BACKEND_DESIRED_COUNT
  SUBNET_IDS          = module.networking.PRIVATE_APP_SUBNET_IDS
  SECURITY_GROUP_IDS = [
    module.backend_security_group.security_group_id
  ]
  ASSIGN_PUBLIC_IP = var.BACKEND_ASSIGN_PUBLIC_IP
  TARGET_GROUP_ARN = module.alb.TARGET_GROUP_ARNS["backend"]
  CONTAINER_NAME   = var.BACKEND_CONTAINER_NAME
  CONTAINER_PORT   = var.BACKEND_CONTAINER_PORT
  TAGS             = var.COMMON_TAGS
}


module "frontend_ecs_service" {
  source              = "./modules/ecs-service"
  SERVICE_NAME        = var.FRONTEND_SERVICE_NAME
  CLUSTER_ARN         = module.ecs_cluster.cluster_arn
  TASK_DEFINITION_ARN = module.frontend_task_definition.TASK_DEFINITION_ARN
  DESIRED_COUNT       = var.FRONTEND_DESIRED_COUNT
  SUBNET_IDS          = module.networking.PRIVATE_APP_SUBNET_IDS
  SECURITY_GROUP_IDS = [
    module.frontend_security_group.security_group_id
  ]
  ASSIGN_PUBLIC_IP = var.FRONTEND_ASSIGN_PUBLIC_IP
  TARGET_GROUP_ARN = module.alb.TARGET_GROUP_ARNS["frontend"]
  CONTAINER_NAME   = var.FRONTEND_CONTAINER_NAME
  CONTAINER_PORT   = var.FRONTEND_CONTAINER_PORT
  TAGS             = var.COMMON_TAGS
}