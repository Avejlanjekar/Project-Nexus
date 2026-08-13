output "DB_ENDPOINT" {
  value = aws_db_instance.this_rds_db.address
}

output "DB_PORT" {
  value = aws_db_instance.this_rds_db.port
}

output "DB_NAME" {
  value = aws_db_instance.this_rds_db.db_name
}
