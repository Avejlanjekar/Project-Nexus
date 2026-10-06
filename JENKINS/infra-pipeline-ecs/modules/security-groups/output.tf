output "ALB_SECURITY_GROUP_ID" {
  description = "ID of the ALB security group"
  value       = aws_security_group.this_alb.id
}

output "ECS_SECURITY_GROUP_ID" {
  description = "ID of the ECS security group"
  value       = aws_security_group.this_ecs.id
}

output "DB_SECURITY_GROUP_ID" {
  description = "ID of the database security group"
  value       = aws_security_group.this_db.id
}