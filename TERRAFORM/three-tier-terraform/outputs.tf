output "RDS_ENDPOINT" {
  value = module.rds.DB_ENDPOINT
}

output "DATABASE_NAME" {
  value = module.rds.DB_NAME
}

output "DATABASE_PORT" {
  value = module.rds.DB_PORT
}


output "ALB_DNS_NAME" {
  value = module.alb.ALB_DNS_NAME
}

output "TARGET_GROUP_ARN" {
  value = module.alb.TARGET_GROUP_ARN
}


output "INSTANCE_ID" {
  value = module.ec2.INSTANCE_ID
}

output "PRIVATE_IP" {
  value = module.ec2.PRIVATE_IP
}

output "ALB_SG_ID" {
  value = module.alb_security_group.security_group_id
}

output "APP_SG_ID" {
  value = module.app_security_group.security_group_id
}

output "DB_SG_ID" {
  value = module.db_security_group.security_group_id
}