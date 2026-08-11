resource "aws_security_group" "this_sg" {

  name   = var.SG_NAME
  vpc_id = var.VPC_ID

  dynamic "ingress" {
    for_each = var.PORTS

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.CIDR_BLOCKS
    }
  }

  dynamic "egress" {
    for_each = var.PORTS

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = var.CIDR_BLOCKS
    }
  }

  tags = {
    Name = var.SG_NAME
  }
}
