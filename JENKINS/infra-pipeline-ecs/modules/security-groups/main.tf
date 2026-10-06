resource "aws_security_group" "this_alb" {

  name   = var.ALB_SECURITY_GROUP_NAME
  vpc_id = var.VPC_ID

  ingress {
    description = var.ALB_INGRESS_RULE.description
    from_port   = var.ALB_INGRESS_RULE.from_port
    to_port     = var.ALB_INGRESS_RULE.to_port
    protocol    = var.ALB_INGRESS_RULE.protocol
    cidr_blocks = var.ALB_INGRESS_RULE.cidr_blocks
  }

  egress {
    description = var.ALB_EGRESS_RULE.description
    from_port   = var.ALB_EGRESS_RULE.from_port
    to_port     = var.ALB_EGRESS_RULE.to_port
    protocol    = var.ALB_EGRESS_RULE.protocol
    cidr_blocks = var.ALB_EGRESS_RULE.cidr_blocks
  }

  tags = merge(var.COMMON_TAGS, {
    Name = var.ALB_SECURITY_GROUP_NAME
  })
}

resource "aws_security_group" "this_ecs" {

  name   = var.ECS_SECURITY_GROUP_NAME
  vpc_id = var.VPC_ID

  dynamic "ingress" {
    for_each = var.ECS_INGRESS_RULES

    content {
      description     = ingress.value.description
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = [aws_security_group.this_alb.id]
    }
  }

  egress {
    description = var.ECS_EGRESS_RULE.description
    from_port   = var.ECS_EGRESS_RULE.from_port
    to_port     = var.ECS_EGRESS_RULE.to_port
    protocol    = var.ECS_EGRESS_RULE.protocol
    cidr_blocks = var.ECS_EGRESS_RULE.cidr_blocks
  }

  tags = merge(var.COMMON_TAGS, {
    Name = var.ECS_SECURITY_GROUP_NAME
  })
}

resource "aws_security_group" "this_db" {

  name   = var.DB_SECURITY_GROUP_NAME
  vpc_id = var.VPC_ID

  ingress {
    description     = var.DB_INGRESS_RULE.description
    from_port       = var.DB_INGRESS_RULE.from_port
    to_port         = var.DB_INGRESS_RULE.to_port
    protocol        = var.DB_INGRESS_RULE.protocol
    security_groups = [aws_security_group.this_ecs.id]
  }

  egress {
    description = var.DB_EGRESS_RULE.description
    from_port   = var.DB_EGRESS_RULE.from_port
    to_port     = var.DB_EGRESS_RULE.to_port
    protocol    = var.DB_EGRESS_RULE.protocol
    cidr_blocks = var.DB_EGRESS_RULE.cidr_blocks
  }

  tags = merge(var.COMMON_TAGS, {
    Name = var.DB_SECURITY_GROUP_NAME
  })
}
