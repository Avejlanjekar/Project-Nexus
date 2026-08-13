resource "aws_ecs_task_definition" "this_task_definition" {
  family                   = var.TASK_FAMILY
  network_mode             = var.NETWORK_MODE
  requires_compatibilities = var.REQUIRES_COMPATIBILITIES
  cpu                      = var.CPU
  memory                   = var.MEMORY
  execution_role_arn       = var.EXECUTION_ROLE_ARN
  container_definitions = jsonencode([
    {
      name      = var.CONTAINER_NAME
      image     = var.CONTAINER_IMAGE
      essential = var.ESSENTIAL
      portMappings = [
        {
          containerPort = var.CONTAINER_PORT
          hostPort      = var.CONTAINER_PORT
          protocol      = "tcp"
        }
      ]
      environment = var.ENVIRONMENT_VARIABLES
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.LOG_GROUP_NAME
          awslogs-region        = var.REGION
          awslogs-stream-prefix = var.CONTAINER_NAME
        }
      }
    }
  ])
  tags = var.TAGS
}