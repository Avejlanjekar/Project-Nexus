# resource "aws_ecs_cluster" "this_cluster" {
#   name = var.ECS_CLUSTER_NAME

#   setting {
#     name  = var.ECS_CLUSTER_SETTING_NAME
#     value = var.ECS_CLUSTER_SETTING_VALUE
#   }

#   tags = merge(var.COMMON_TAGS, {
#     Name = var.ECS_CLUSTER_NAME
#   })
# }


# resource "aws_ecs_task_definition" "this_backend" {
#   family                   = var.BACKEND_TASK_DEFINITION_FAMILY
#   network_mode             = var.ECS_NETWORK_MODE
#   requires_compatibilities = var.ECS_REQUIRES_COMPATIBILITIES
#   cpu                      = var.ECS_TASK_CPU
#   memory                   = var.ECS_TASK_MEMORY
#   execution_role_arn       = var.ECS_TASK_EXECUTION_ROLE_ARN

#   container_definitions = jsonencode([
#     {
#       name      = var.BACKEND_CONTAINER_NAME
#       image     = var.BACKEND_IMAGE
#       essential = true

#       portMappings = [
#         {
#           containerPort = var.BACKEND_CONTAINER_PORT
#           protocol      = "tcp"
#         }
#       ]

#       environment = [
#         {
#           name  = "DB_NAME"
#           value = var.BACKEND_DB_NAME
#         },
#         {
#           name  = "DB_HOST"
#           value = var.BACKEND_DB_HOST
#         },
#         {
#           name  = "DB_PORT"
#           value = var.BACKEND_DB_PORT
#         },
#         {
#           name  = "DB_USER"
#           value = var.BACKEND_DB_USER
#         },
#         {
#           name  = "DB_PASSWORD"
#           value = var.BACKEND_DB_PASSWORD
#         }
#       ]

#       logConfiguration = {
#         logDriver = "awslogs"

#         options = {
#           awslogs-group         = var.BACKEND_LOG_GROUP_NAME
#           awslogs-region        = var.AWS_REGION
#           awslogs-stream-prefix = "backend"
#         }
#       }
#     }
#   ])
# }


# resource "aws_ecs_task_definition" "this_frontend" {
#   family                   = var.FRONTEND_TASK_DEFINITION_FAMILY
#   network_mode             = var.ECS_NETWORK_MODE
#   requires_compatibilities = var.ECS_REQUIRES_COMPATIBILITIES
#   cpu                      = var.ECS_TASK_CPU
#   memory                   = var.ECS_TASK_MEMORY
#   execution_role_arn       = var.ECS_TASK_EXECUTION_ROLE_ARN

#   container_definitions = jsonencode([
#     {
#       name      = var.FRONTEND_CONTAINER_NAME
#       image     = var.FRONTEND_IMAGE
#       essential = true

#       portMappings = [
#         {
#           containerPort = var.FRONTEND_CONTAINER_PORT
#           protocol      = "tcp"
#         }
#       ]

#       environment = [
#         {
#           name  = "BACKEND_HOST"
#           value = var.FRONTEND_BACKEND_HOST
#         }
#       ]

#       logConfiguration = {
#         logDriver = "awslogs"

#         options = {
#           awslogs-group         = var.FRONTEND_LOG_GROUP_NAME
#           awslogs-region        = var.AWS_REGION
#           awslogs-stream-prefix = "frontend"
#         }
#       }
#     }
#   ])
# }


# resource "aws_ecs_task_definition" "this_database" {
#   family                   = var.DATABASE_TASK_DEFINITION_FAMILY
#   network_mode             = var.ECS_NETWORK_MODE
#   requires_compatibilities = var.ECS_REQUIRES_COMPATIBILITIES
#   cpu                      = var.ECS_TASK_CPU
#   memory                   = var.ECS_TASK_MEMORY
#   execution_role_arn       = var.ECS_TASK_EXECUTION_ROLE_ARN

#   container_definitions = jsonencode([
#     {
#       name      = var.DATABASE_CONTAINER_NAME
#       image     = var.DATABASE_IMAGE
#       essential = true

#       portMappings = [
#         {
#           containerPort = var.DATABASE_CONTAINER_PORT
#           protocol      = "tcp"
#         }
#       ]

#       environment = [
#         {
#           name  = "MYSQL_DATABASE"
#           value = var.DATABASE_NAME
#         },
#         {
#           name  = "MYSQL_ROOT_PASSWORD"
#           value = var.DATABASE_ROOT_PASSWORD
#         }
#       ]

#       logConfiguration = {
#         logDriver = "awslogs"

#         options = {
#           awslogs-group         = var.DATABASE_LOG_GROUP_NAME
#           awslogs-region        = var.AWS_REGION
#           awslogs-stream-prefix = "database"
#         }
#       }
#     }
#   ])
# }

# # ---------------------------------------------------------
# # Backend ECS Service
# # ---------------------------------------------------------

# resource "aws_ecs_service" "this_backend" {
#   name            = var.BACKEND_SERVICE_NAME
#   cluster         = aws_ecs_cluster.this_cluster.id
#   task_definition = aws_ecs_task_definition.this_backend.arn

#   desired_count = var.ECS_SERVICE_DESIRED_COUNT
#   launch_type   = var.ECS_LAUNCH_TYPE

#   network_configuration {
#     subnets          = var.ECS_APP_SUBNET_IDS
#     security_groups  = [var.ECS_SECURITY_GROUP_ID]
#     assign_public_ip = var.ECS_ASSIGN_PUBLIC_IP
#   }

#   dynamic "load_balancer" {
#     for_each = var.ENABLE_BACKEND_LOAD_BALANCER ? [1] : []

#     content {
#       target_group_arn = var.BACKEND_TARGET_GROUP_ARN
#       container_name   = var.BACKEND_CONTAINER_NAME
#       container_port   = var.BACKEND_CONTAINER_PORT
#     }
#   }

#   service_registries {
#     registry_arn = var.BACKEND_CLOUD_MAP_SERVICE_ARN
#   }

#   lifecycle {
#     ignore_changes = [
#       task_definition
#     ]
#   }

#   tags = merge(var.COMMON_TAGS, {
#     Name = var.BACKEND_SERVICE_NAME
#   })
# }


# # ---------------------------------------------------------
# # Frontend ECS Service
# # ---------------------------------------------------------

# resource "aws_ecs_service" "this_frontend" {
#   name            = var.FRONTEND_SERVICE_NAME
#   cluster         = aws_ecs_cluster.this_cluster.id
#   task_definition = aws_ecs_task_definition.this_frontend.arn

#   desired_count = var.ECS_SERVICE_DESIRED_COUNT
#   launch_type   = var.ECS_LAUNCH_TYPE

#   network_configuration {
#     subnets          = var.ECS_APP_SUBNET_IDS
#     security_groups  = [var.ECS_SECURITY_GROUP_ID]
#     assign_public_ip = var.ECS_ASSIGN_PUBLIC_IP
#   }

#   dynamic "load_balancer" {
#     for_each = var.ENABLE_FRONTEND_LOAD_BALANCER ? [1] : []

#     content {
#       target_group_arn = var.FRONTEND_TARGET_GROUP_ARN
#       container_name   = var.FRONTEND_CONTAINER_NAME
#       container_port   = var.FRONTEND_CONTAINER_PORT
#     }
#   }

#   service_registries {
#     registry_arn = var.FRONTEND_CLOUD_MAP_SERVICE_ARN
#   }

#   lifecycle {
#     ignore_changes = [
#       task_definition
#     ]
#   }

#   tags = merge(var.COMMON_TAGS, {
#     Name = var.FRONTEND_SERVICE_NAME
#   })
# }


# # ---------------------------------------------------------
# # Database ECS Service
# # ---------------------------------------------------------

# resource "aws_ecs_service" "this_database" {
#   name            = var.DATABASE_SERVICE_NAME
#   cluster         = aws_ecs_cluster.this_cluster.id
#   task_definition = aws_ecs_task_definition.this_database.arn

#   desired_count = var.ECS_SERVICE_DESIRED_COUNT
#   launch_type   = var.ECS_LAUNCH_TYPE

#   network_configuration {
#     subnets          = var.ECS_DB_SUBNET_IDS
#     security_groups  = [var.DB_SECURITY_GROUP_ID]
#     assign_public_ip = var.ECS_ASSIGN_PUBLIC_IP
#   }

#   service_registries {
#     registry_arn = var.DATABASE_CLOUD_MAP_SERVICE_ARN
#   }

#   lifecycle {
#     ignore_changes = [
#       task_definition
#     ]
#   }

#   tags = merge(var.COMMON_TAGS, {
#     Name = var.DATABASE_SERVICE_NAME
#   })
# }


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