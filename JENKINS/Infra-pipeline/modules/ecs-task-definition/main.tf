resource "aws_ecs_task_definition" "this_backend" {
  family                   = var.BACKEND_TASK_DEFINITION_FAMILY
  network_mode             = var.ECS_NETWORK_MODE
  requires_compatibilities = var.ECS_REQUIRES_COMPATIBILITIES
  cpu                      = var.ECS_TASK_CPU
  memory                   = var.ECS_TASK_MEMORY
  execution_role_arn       = var.ECS_TASK_EXECUTION_ROLE_ARN
  container_definitions = jsonencode([
    {
      name      = var.BACKEND_CONTAINER_NAME
      image     = var.BACKEND_IMAGE
      essential = true

      portMappings = [
        {
          containerPort = var.BACKEND_CONTAINER_PORT
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "DB_NAME"
          value = var.BACKEND_DB_NAME
        },
        {
          name  = "DB_HOST"
          value = var.BACKEND_DB_HOST
        },
        {
          name  = "DB_PORT"
          value = var.BACKEND_DB_PORT
        },
        {
          name  = "DB_USER"
          value = var.BACKEND_DB_USER
        },
        {
          name  = "DB_PASSWORD"
          value = var.BACKEND_DB_PASSWORD
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = var.BACKEND_LOG_GROUP_NAME
          awslogs-region        = var.AWS_REGION
          awslogs-stream-prefix = "backend"
        }
      }
    }
  ])
}


resource "aws_ecs_task_definition" "this_frontend" {
  family                   = var.FRONTEND_TASK_DEFINITION_FAMILY
  network_mode             = var.ECS_NETWORK_MODE
  requires_compatibilities = var.ECS_REQUIRES_COMPATIBILITIES
  cpu                      = var.ECS_TASK_CPU
  memory                   = var.ECS_TASK_MEMORY
  execution_role_arn       = var.ECS_TASK_EXECUTION_ROLE_ARN
  container_definitions = jsonencode([
    {
      name      = var.FRONTEND_CONTAINER_NAME
      image     = var.FRONTEND_IMAGE
      essential = true
      portMappings = [
        {
          containerPort = var.FRONTEND_CONTAINER_PORT
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "BACKEND_HOST"
          value = var.FRONTEND_BACKEND_HOST
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.FRONTEND_LOG_GROUP_NAME
          awslogs-region        = var.AWS_REGION
          awslogs-stream-prefix = "frontend"
        }
      }
    }
  ])
}


resource "aws_ecs_task_definition" "this_database" {
  family                   = var.DATABASE_TASK_DEFINITION_FAMILY
  network_mode             = var.ECS_NETWORK_MODE
  requires_compatibilities = var.ECS_REQUIRES_COMPATIBILITIES
  cpu                      = var.ECS_TASK_CPU
  memory                   = var.ECS_TASK_MEMORY
  execution_role_arn       = var.ECS_TASK_EXECUTION_ROLE_ARN
  container_definitions = jsonencode([
    {
      name      = var.DATABASE_CONTAINER_NAME
      image     = var.DATABASE_IMAGE
      essential = true

      portMappings = [
        {
          containerPort = var.DATABASE_CONTAINER_PORT
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "MYSQL_DATABASE"
          value = var.DATABASE_NAME
        },
        {
          name  = "MYSQL_ROOT_PASSWORD"
          value = var.DATABASE_ROOT_PASSWORD
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.DATABASE_LOG_GROUP_NAME
          awslogs-region        = var.AWS_REGION
          awslogs-stream-prefix = "database"
        }
      }
    }
  ])
}