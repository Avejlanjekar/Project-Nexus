output "BACKEND_TASK_DEFINITION_ARN" {
  description = "Backend ECS task definition ARN"
  value       = aws_ecs_task_definition.this_backend.arn
}

output "FRONTEND_TASK_DEFINITION_ARN" {
  description = "Frontend ECS task definition ARN"
  value       = aws_ecs_task_definition.this_frontend.arn
}

output "DATABASE_TASK_DEFINITION_ARN" {
  description = "Database ECS task definition ARN"
  value       = aws_ecs_task_definition.this_database.arn
}