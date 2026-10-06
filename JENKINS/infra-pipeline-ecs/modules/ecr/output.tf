output "BACKEND_REPOSITORY_URL" {
  description = "URL of the backend ECR repository"
  value       = aws_ecr_repository.this_backend.repository_url
}

output "FRONTEND_REPOSITORY_URL" {
  description = "URL of the frontend ECR repository"
  value       = aws_ecr_repository.this_frontend.repository_url
}

output "DATABASE_REPOSITORY_URL" {
  description = "URL of the database ECR repository"
  value       = aws_ecr_repository.this_database.repository_url
}

output "BACKEND_REPOSITORY_ARN" {
  description = "ARN of the backend ECR repository"
  value       = aws_ecr_repository.this_backend.arn
}

output "FRONTEND_REPOSITORY_ARN" {
  description = "ARN of the frontend ECR repository"
  value       = aws_ecr_repository.this_frontend.arn
}

output "DATABASE_REPOSITORY_ARN" {
  description = "ARN of the database ECR repository"
  value       = aws_ecr_repository.this_database.arn
}