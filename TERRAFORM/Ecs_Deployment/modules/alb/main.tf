resource "aws_lb" "this_alb" {
  name                       = var.ALB_NAME
  internal                   = var.ALB_INTERNAL
  load_balancer_type         = var.LOAD_BALANCER_TYPE
  security_groups            = [var.ALB_SG]
  subnets                    = var.PUBLIC_SUBNET_IDS
  enable_deletion_protection = var.ENABLE_DELETION_PROTECTION
  tags = merge(
    var.ALB_COMMON_TAGS,
    {
      Name = var.ALB_NAME
    }
  )
}


resource "aws_lb_target_group" "this_target_group" {
  for_each    = var.TARGET_GROUPS
  name        = each.value.name
  port        = each.value.port
  protocol    = each.value.protocol
  vpc_id      = var.VPC_ID
  target_type = each.value.target_type
  health_check {
    path = each.value.health_check_path
  }
  tags = {
    Name = each.value.name
  }
}


resource "aws_lb_listener" "this_http_listener" {
  load_balancer_arn = aws_lb.this_alb.arn
  port              = var.LISTENER_PORT
  protocol          = var.PROTOCOL
  default_action {
    type = var.LISTENER_DEFAULT_ACTION_TYPE
    target_group_arn = aws_lb_target_group.this_target_group[
      var.DEFAULT_TARGET_GROUP
    ].arn
  }
}


resource "aws_lb_listener_rule" "this_listener_rule" {
  listener_arn = aws_lb_listener.this_http_listener.arn
  priority     = var.BACKEND_LISTENER_RULE_PRIORITY
  action {
    type = var.LISTENER_RULE_ACTION_TYPE
    target_group_arn = aws_lb_target_group.this_target_group[
      var.LISTENER_RULE_TARGET_GROUP
    ].arn
  }
  condition {
    path_pattern {
      values = var.LISTENER_RULE_PATH_PATTERNS
    }
  }
}