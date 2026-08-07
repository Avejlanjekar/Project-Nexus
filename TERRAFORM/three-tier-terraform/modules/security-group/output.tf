output "ALB_SG_ID" {
  value = aws_security_group.this_alb_sg.id
}

output "APP_SG_ID" {
  value = aws_security_group.this_app_sg.id
}

output "DB_SG_ID" {
  value = aws_security_group.this_db_sg.id
}
