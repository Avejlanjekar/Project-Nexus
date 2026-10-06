output "BACKEND_LOG_GROUP_NAME" {
  description = "Name of the backend CloudWatch log group"
  value       = aws_cloudwatch_log_group.this_backend.name
}

output "FRONTEND_LOG_GROUP_NAME" {
  description = "Name of the frontend CloudWatch log group"
  value       = aws_cloudwatch_log_group.this_frontend.name
}

output "DATABASE_LOG_GROUP_NAME" {
  description = "Name of the database CloudWatch log group"
  value       = aws_cloudwatch_log_group.this_database.name
}