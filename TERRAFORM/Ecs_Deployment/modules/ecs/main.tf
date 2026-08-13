resource "aws_ecs_cluster" "this_cluster" {
  name = var.CLUSTER_NAME
  tags = merge(var.COMMON_TAGS, {
    Name = var.CLUSTER_NAME
  })
}