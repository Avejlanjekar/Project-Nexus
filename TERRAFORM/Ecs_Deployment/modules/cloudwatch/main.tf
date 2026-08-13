resource "aws_cloudwatch_log_group" "this_log_group" {
  name              = var.LOG_GROUP_NAME
  retention_in_days = var.RETENTION_IN_DAYS
  tags              = var.TAGS
}