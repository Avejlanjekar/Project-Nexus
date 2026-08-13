output "ALB_DNS_NAME" {
  value = aws_lb.this_alb.dns_name
}

output "ALB_ARN" {
  value = aws_lb.this_alb.arn
}

output "TARGET_GROUP_ARNS" {
  value = {
    for key, target_group in aws_lb_target_group.this_target_group :
    key => target_group.arn
  }
}