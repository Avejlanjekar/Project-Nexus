output "ECS_TASK_EXECUTION_ROLE_ARN" {
  description = "ARN of the ECS task execution role"
  value       = aws_iam_role.this_ecs_task_execution_role.arn
}

output "ECS_TASK_EXECUTION_ROLE_NAME" {
  description = "Name of the ECS task execution role"
  value       = aws_iam_role.this_ecs_task_execution_role.name
}