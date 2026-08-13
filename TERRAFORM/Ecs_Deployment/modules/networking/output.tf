output "VPC_ID" {
  value = aws_vpc.this_vpc.id
}

output "PUBLIC_SUBNET_IDS" {
  value = aws_subnet.this_public_subnet[*].id
}

output "PRIVATE_APP_SUBNET_IDS" {
  value = aws_subnet.this_private_app_subnet[*].id
}

output "PRIVATE_DB_SUBNET_IDS" {
  value = aws_subnet.this_private_db_subnet[*].id
}
