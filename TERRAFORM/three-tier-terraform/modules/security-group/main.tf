resource "aws_security_group" "this_alb_sg" {
  name        = var.ALB_SG_NAME
  description = "security group from ALB"
  vpc_id      = var.VPC_ID

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ALB_SG_NAME
  }
}


resource "aws_security_group" "this_app_sg" {

  name        = var.APP_SG_NAME
  description = "Application security group"
  vpc_id      = var.VPC_ID
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.this_alb_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.APP_SG_NAME
  }
}

resource "aws_security_group" "this_db_sg" {
  name        = var.DB_SG_NAME
  description = "Database Security group"
  vpc_id      = var.VPC_ID
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.this_app_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.DB_SG_NAME
  }
}
