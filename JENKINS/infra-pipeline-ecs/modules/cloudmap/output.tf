output "NAMESPACE_ID" {
  description = "ID of the Cloud Map private DNS namespace"
  value       = aws_service_discovery_private_dns_namespace.this_namespace.id
}

output "NAMESPACE_ARN" {
  description = "ARN of the Cloud Map private DNS namespace"
  value       = aws_service_discovery_private_dns_namespace.this_namespace.arn
}

output "NAMESPACE_NAME" {
  description = "Name of the Cloud Map private DNS namespace"
  value       = aws_service_discovery_private_dns_namespace.this_namespace.name
}

output "BACKEND_SERVICE_ID" {
  description = "Cloud Map backend service ID"
  value       = aws_service_discovery_service.this_backend.id
}

output "FRONTEND_SERVICE_ID" {
  description = "Cloud Map frontend service ID"
  value       = aws_service_discovery_service.this_frontend.id
}

output "DATABASE_SERVICE_ID" {
  description = "Cloud Map database service ID"
  value       = aws_service_discovery_service.this_database.id
}

output "BACKEND_SERVICE_ARN" {
  description = "ARN of the Cloud Map backend service"
  value       = aws_service_discovery_service.this_backend.arn
}

output "FRONTEND_SERVICE_ARN" {
  description = "ARN of the Cloud Map frontend service"
  value       = aws_service_discovery_service.this_frontend.arn
}

output "DATABASE_SERVICE_ARN" {
  description = "ARN of the Cloud Map database service"
  value       = aws_service_discovery_service.this_database.arn
}