output "ECS_CLUSTER_ID" {
  description = "ECS cluster ID"
  value       = aws_ecs_cluster.this_cluster.id
}

output "ECS_CLUSTER_ARN" {
  description = "ECS cluster ARN"
  value       = aws_ecs_cluster.this_cluster.arn
}