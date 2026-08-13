output "INSTANCE_ID" {
  value = aws_instance.this_app.id
}

output "PRIVATE_IP" {
  value = aws_instance.this_app.private_ip
}
