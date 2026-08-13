resource "aws_ecs_service" "this_ecs_service" {

  name            = var.SERVICE_NAME
  cluster         = var.CLUSTER_ARN
  task_definition = var.TASK_DEFINITION_ARN

  desired_count = var.DESIRED_COUNT

  launch_type = "FARGATE"

  network_configuration {
    subnets          = var.SUBNET_IDS
    security_groups  = var.SECURITY_GROUP_IDS
    assign_public_ip = var.ASSIGN_PUBLIC_IP
  }

  load_balancer {
    target_group_arn = var.TARGET_GROUP_ARN
    container_name   = var.CONTAINER_NAME
    container_port   = var.CONTAINER_PORT
  }

  tags = var.TAGS
}