resource "aws_lb" "this_alb" {
  name               = var.ALB_NAME
  internal           = var.ALB_INTERNAL
  load_balancer_type = var.ALB_LOAD_BALANCER_TYPE
  security_groups    = [var.ALB_SECURITY_GROUP_ID]
  subnets            = var.ALB_SUBNET_IDS

  tags = merge(var.COMMON_TAGS, {
    Name = var.ALB_NAME
  })
}

resource "aws_lb_target_group" "this_backend_target_group" {
  name        = var.BACKEND_TARGET_GROUP_NAME
  port        = var.BACKEND_TARGET_GROUP_PORT
  protocol    = var.BACKEND_TARGET_GROUP_PROTOCOL
  target_type = var.BACKEND_TARGET_TYPE

  vpc_id = var.VPC_ID

  health_check {
    path = var.BACKEND_HEALTH_CHECK_PATH
    port = var.BACKEND_HEALTH_CHECK_PORT
  }

  tags = merge(var.COMMON_TAGS, {
    Name = var.BACKEND_TARGET_GROUP_NAME
  })
}

resource "aws_lb_target_group" "this_frontend_target_group" {
  name        = var.FRONTEND_TARGET_GROUP_NAME
  port        = var.FRONTEND_TARGET_GROUP_PORT
  protocol    = var.FRONTEND_TARGET_GROUP_PROTOCOL
  target_type = var.FRONTEND_TARGET_TYPE

  vpc_id = var.VPC_ID

  health_check {
    path = var.FRONTEND_HEALTH_CHECK_PATH
    port = var.FRONTEND_HEALTH_CHECK_PORT
  }

  tags = merge(var.COMMON_TAGS, {
    Name = var.FRONTEND_TARGET_GROUP_NAME
  })
}

resource "aws_lb_listener" "this_listener" {
  load_balancer_arn = aws_lb.this_alb.arn
  port              = var.ALB_LISTENER_PORT
  protocol          = var.ALB_LISTENER_PROTOCOL

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this_frontend_target_group.arn
  }
}

resource "aws_lb_listener_rule" "this_backend_rule" {
  listener_arn = aws_lb_listener.this_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this_backend_target_group.arn
  }

  condition {
    path_pattern {
      values = ["/api/*"]
    }
  }
}