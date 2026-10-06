output "VPC_ID" {
  description = "ID of the VPC"
  value       = aws_vpc.this_vpc.id
}

output "PUBLIC_SUBNET_IDS" {
  description = "IDs of public subnets"
  value       = aws_subnet.this_public_subnet[*].id
}

output "APP_SUBNET_IDS" {
  description = "IDs of application private subnets"
  value       = aws_subnet.this_private_app_subnet[*].id
}

output "DB_SUBNET_IDS" {
  description = "IDs of database private subnets"
  value       = aws_subnet.this_private_db_subnet[*].id
}

output "NAT_GATEWAY_ID" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.this_nat.id
}