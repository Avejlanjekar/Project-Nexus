output "ALB_ID" {
  description = "ID of the Application Load Balancer"
  value       = aws_lb.this_alb.id
}

output "ALB_ARN" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.this_alb.arn
}

output "ALB_DNS_NAME" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.this_alb.dns_name
}

output "BACKEND_TARGET_GROUP_ARN" {
  description = "ARN of the backend target group"
  value       = aws_lb_target_group.this_backend_target_group.arn
}

output "BACKEND_TARGET_GROUP_NAME" {
  description = "Name of the backend target group"
  value       = aws_lb_target_group.this_backend_target_group.name
}

output "FRONTEND_TARGET_GROUP_ARN" {
  description = "ARN of the frontend target group"
  value       = aws_lb_target_group.this_frontend_target_group.arn
}

output "FRONTEND_TARGET_GROUP_NAME" {
  description = "Name of the frontend target group"
  value       = aws_lb_target_group.this_frontend_target_group.name
}

output "ALB_LISTENER_ARN" {
  description = "ARN of the ALB listener"
  value       = aws_lb_listener.this_listener.arn
}

output "BACKEND_LISTENER_RULE_ARN" {
  description = "ARN of the backend listener rule"
  value       = aws_lb_listener_rule.this_backend_rule.arn
}