output "Repository_url" {
  value = aws_ecr_repository.this_ecr.repository_url
}

output "Repository_arn" {
  value = aws_ecr_repository.this_ecr.arn
}