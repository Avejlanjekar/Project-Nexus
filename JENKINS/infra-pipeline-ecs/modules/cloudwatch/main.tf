resource "aws_cloudwatch_log_group" "this_backend" {
  name              = var.BACKEND_LOG_GROUP_NAME
  retention_in_days = var.LOG_GROUP_RETENTION_DAYS

  tags = merge(var.COMMON_TAGS, {
    Name = var.BACKEND_LOG_GROUP_NAME
  })
}

resource "aws_cloudwatch_log_group" "this_frontend" {
  name              = var.FRONTEND_LOG_GROUP_NAME
  retention_in_days = var.LOG_GROUP_RETENTION_DAYS

  tags = merge(var.COMMON_TAGS, {
    Name = var.FRONTEND_LOG_GROUP_NAME
  })
}

resource "aws_cloudwatch_log_group" "this_database" {
  name              = var.DATABASE_LOG_GROUP_NAME
  retention_in_days = var.LOG_GROUP_RETENTION_DAYS

  tags = merge(var.COMMON_TAGS, {
    Name = var.DATABASE_LOG_GROUP_NAME
  })
}