resource "aws_lb" "this_alb" {
  name                       = var.ALB_NAME
  internal                   = var.ALB_INTERNAL
  load_balancer_type         = var.LOAD_BALANCER_TYPE
  security_groups            = [var.ALB_SG]
  subnets                    = var.PUBLIC_SUBNET_IDS
  enable_deletion_protection = var.ENABLE_DELETION_PROTECTION
  tags = merge(
    var.ALB_COMMON_TAGS, {
      Name = var.ALB_NAME
  })
}

resource "aws_lb_target_group" "this_app_lb_tg" {
  name        = var.TG_NAME
  port        = var.ALB_PORT
  protocol    = var.PROTOCOL
  vpc_id      = var.VPC_ID
  target_type = var.TARGET_TYPE
  health_check {
    path = var.HEALTH_CHECK_PATH
  }
  tags = {
    Name = var.TG_NAME
  }
}

resource "aws_lb_listener" "this_http_listener" {
  load_balancer_arn = aws_lb.this_alb.arn
  port              = var.LISTENER_PORT
  protocol          = var.PROTOCOL
  default_action {
    type             = var.LISTENER_DEFAULT_ACTION_TYPE
    target_group_arn = aws_lb_target_group.this_app_lb_tg.arn
  }
}