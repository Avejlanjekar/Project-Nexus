
resource "aws_ecs_cluster" "this_cluster" {
  name = var.ECS_CLUSTER_NAME
  setting {
    name  = var.ECS_CLUSTER_SETTING_NAME
    value = var.ECS_CLUSTER_SETTING_VALUE
  }
  tags = merge(var.COMMON_TAGS, {
    Name = var.ECS_CLUSTER_NAME
  })
}