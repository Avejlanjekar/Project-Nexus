
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
}

module "Security_groups" {
  source      = "./modules/security-group"
  VPC_ID      = module.networking.VPC_ID
  DB_SG_NAME  = var.DB_SG_NAME
  ALB_SG_NAME = var.ALB_SG_NAME
  APP_SG_NAME = var.APP_SG_NAME
}

module "alb" {
  source                     = "./modules/alb"
  VPC_ID                     = module.networking.VPC_ID
  PUBLIC_SUBNET_IDS          = module.networking.PUBLIC_SUBNET_IDS
  ALB_SG                     = module.Security_groups.ALB_SG_ID
  ALB_NAME                   = var.ALB_NAME
  ALB_INTERNAL               = var.ALB_INTERNAL
  LOAD_BALANCER_TYPE         = var.LOAD_BALANCER_TYPE
  ENABLE_DELETION_PROTECTION = var.ENABLE_DELETION_PROTECTION

  TG_NAME     = var.TG_NAME
  ALB_PORT    = var.ALB_PORT
  PROTOCOL    = var.PROTOCOL
  TARGET_TYPE = var.TARGET_TYPE

  HEALTH_CHECK_PATH = var.HEALTH_CHECK_PATH

  LISTENER_PORT                = var.LISTENER_PORT
  LISTENER_DEFAULT_ACTION_TYPE = var.LISTENER_DEFAULT_ACTION_TYPE

}

module "rds" {
  source        = "./modules/rds"
  DB_SUBNET_IDS = module.networking.PRIVATE_DB_SUBNET_IDS
  DB_SG_ID      = module.Security_groups.DB_SG_ID

  DB_NAME  = var.DB_NAME
  USERNAME = var.DB_USERNAME
  PASSWORD = var.DB_PASSWORD

  ENGINE               = var.ENGINE
  ENGINE_VERSION       = var.ENGINE_VERSION
  INSTANCE_CLASS       = var.INSTANCE_CLASS
  ALLOCATED_STORAGE    = var.ALLOCATED_STORAGE
  PUBLICLY_ACCESSIBLE  = var.PUBLICLY_ACCESSIBLE
  SKIP_FINAL_SNAPSHOT  = var.SKIP_FINAL_SNAPSHOT
  DB_SUBNET_GROUP_NAME = var.DB_SUBNET_GROUP_NAME
}

module "keypair" {
  source          = "./modules/keypair"
  ALGORITHM       = var.ALGORITHM
  RSA_BITS        = var.RSA_BITS
  KEY_NAME        = var.KEY_NAME
  FILENAME        = var.FILENAME
  FILE_PERMISSION = var.FILE_PERMISSION
}

module "ec2" {
  source            = "./modules/ec2"
  AMI               = data.aws_ami.amazon_linux.id
  INSTANCE_TYPE     = var.INSTANCE_TYPE
  SUBNET_ID         = module.networking.PRIVATE_APP_SUBNET_IDS[0]
  APP_SG_ID         = module.Security_groups.APP_SG_ID
  KEY_NAME          = module.keypair.KEY_NAME
  INSTANCE_NAME     = var.INSTANCE_NAME
  TARGET_GROUP_ARN  = module.alb.TARGET_GROUP_ARN
  TARGET_GROUP_PORT = var.TARGET_GROUP_PORT

  GITHUB_REPO = var.GITHUB_REPO
  DB_HOST     = var.DB_HOST
  DB_USER     = var.DB_USER
  DB_PASSWORD = var.DB_PASSWORD
  DB_NAME     = var.DB_NAME
}


