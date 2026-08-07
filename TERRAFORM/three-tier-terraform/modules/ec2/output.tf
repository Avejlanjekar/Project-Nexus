output "INSTANCE_ID" {
  value = aws_instance.app.id
}

output "PRIVATE_IP" {
  value = aws_instance.app.private_ip
}
