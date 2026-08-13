output "Frontend_ecr_url" {
  value = module.frontend_ecr.Repository_url
}

output "Backend_ecr_url" {
  value = module.backend_ecr.Repository_url
}
