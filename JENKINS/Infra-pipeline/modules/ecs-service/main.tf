resource "aws_ecs_service" "this_backend" {
  name            = var.BACKEND_SERVICE_NAME
  cluster         = var.ECS_CLUSTER_ID
  task_definition = var.BACKEND_TASK_DEFINITION_ARN

  desired_count = var.ECS_SERVICE_DESIRED_COUNT
  launch_type   = var.ECS_LAUNCH_TYPE

  network_configuration {
    subnets          = var.ECS_APP_SUBNET_IDS
    security_groups  = [var.ECS_SECURITY_GROUP_ID]
    assign_public_ip = var.ECS_ASSIGN_PUBLIC_IP
  }

  dynamic "load_balancer" {
    for_each = var.ENABLE_BACKEND_LOAD_BALANCER ? [1] : []

    content {
      target_group_arn = var.BACKEND_TARGET_GROUP_ARN
      container_name   = var.BACKEND_CONTAINER_NAME
      container_port   = var.BACKEND_CONTAINER_PORT
    }
  }

  service_registries {
    registry_arn = var.BACKEND_CLOUD_MAP_SERVICE_ARN
  }

  lifecycle {
    ignore_changes = [
      task_definition
    ]
  }

  tags = merge(var.COMMON_TAGS, {
    Name = var.BACKEND_SERVICE_NAME
  })
}


resource "aws_ecs_service" "this_frontend" {
  name            = var.FRONTEND_SERVICE_NAME
  cluster         = var.ECS_CLUSTER_ID
  task_definition = var.FRONTEND_TASK_DEFINITION_ARN

  desired_count = var.ECS_SERVICE_DESIRED_COUNT
  launch_type   = var.ECS_LAUNCH_TYPE

  network_configuration {
    subnets          = var.ECS_APP_SUBNET_IDS
    security_groups  = [var.ECS_SECURITY_GROUP_ID]
    assign_public_ip = var.ECS_ASSIGN_PUBLIC_IP
  }

  dynamic "load_balancer" {
    for_each = var.ENABLE_FRONTEND_LOAD_BALANCER ? [1] : []

    content {
      target_group_arn = var.FRONTEND_TARGET_GROUP_ARN
      container_name   = var.FRONTEND_CONTAINER_NAME
      container_port   = var.FRONTEND_CONTAINER_PORT
    }
  }

  service_registries {
    registry_arn = var.FRONTEND_CLOUD_MAP_SERVICE_ARN
  }

  lifecycle {
    ignore_changes = [
      task_definition
    ]
  }

  tags = merge(var.COMMON_TAGS, {
    Name = var.FRONTEND_SERVICE_NAME
  })
}


resource "aws_ecs_service" "this_database" {
  name            = var.DATABASE_SERVICE_NAME
  cluster         = var.ECS_CLUSTER_ID
  task_definition = var.DATABASE_TASK_DEFINITION_ARN

  desired_count = var.ECS_SERVICE_DESIRED_COUNT
  launch_type   = var.ECS_LAUNCH_TYPE

  network_configuration {
    subnets          = var.ECS_DB_SUBNET_IDS
    security_groups  = [var.DB_SECURITY_GROUP_ID]
    assign_public_ip = var.ECS_ASSIGN_PUBLIC_IP
  }

  service_registries {
    registry_arn = var.DATABASE_CLOUD_MAP_SERVICE_ARN
  }

  lifecycle {
    ignore_changes = [
      task_definition
    ]
  }

  tags = merge(var.COMMON_TAGS, {
    Name = var.DATABASE_SERVICE_NAME
  })
}