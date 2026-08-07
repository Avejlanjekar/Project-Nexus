output "Rds_endpoint" {
  value = module.rds.DB_ENDPOINT
}

output "Databse_name" {
  value = module.rds.DB_NAME
}

output "Database_port" {
  value = module.rds.DB_PORT
}


output "Alb_dns_name" {
  value = module.alb.ALB_DNS_NAME
}

output "Target_group_arn" {
  value = module.alb.TARGET_GROUP_ARN
}


output "Instance_id" {
  value = module.ec2.INSTANCE_ID
}

output "Private_ip" {
  value = module.ec2.PRIVATE_IP
}
