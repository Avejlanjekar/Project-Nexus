resource "aws_service_discovery_private_dns_namespace" "this_namespace" {
  name        = var.NAMESPACE_NAME
  description = var.NAMESPACE_DESCRIPTION
  vpc         = var.VPC_ID
  tags = merge(var.COMMON_TAGS, {
    Name = var.NAMESPACE_NAME
  })
}

resource "aws_service_discovery_service" "this_backend" {
  name = var.BACKEND_SERVICE_NAME
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.this_namespace.id

    dns_records {
      type = var.DNS_RECORD_TYPE
      ttl  = var.DNS_RECORD_TTL
    }
  }
  tags = merge(var.COMMON_TAGS, {
    Name = var.BACKEND_SERVICE_NAME
  })
}

resource "aws_service_discovery_service" "this_frontend" {
  name = var.FRONTEND_SERVICE_NAME
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.this_namespace.id
    dns_records {
      type = var.DNS_RECORD_TYPE
      ttl  = var.DNS_RECORD_TTL
    }
  }
  tags = merge(var.COMMON_TAGS, {
    Name = var.FRONTEND_SERVICE_NAME
  })
}

resource "aws_service_discovery_service" "this_database" {
  name = var.DATABASE_SERVICE_NAME
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.this_namespace.id
    dns_records {
      type = var.DNS_RECORD_TYPE
      ttl  = var.DNS_RECORD_TTL
    }
  }

  tags = merge(var.COMMON_TAGS, {
    Name = var.DATABASE_SERVICE_NAME
  })
}