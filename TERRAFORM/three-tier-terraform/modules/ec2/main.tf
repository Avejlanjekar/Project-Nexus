resource "aws_instance" "app" {
  ami                    = var.AMI
  instance_type          = var.INSTANCE_TYPE
  subnet_id              = var.SUBNET_ID
  vpc_security_group_ids = [var.APP_SG_ID]
  key_name               = var.KEY_NAME
  tags = {
    Name = var.INSTANCE_NAME
  }
}

resource "aws_lb_target_group_attachment" "app" {
  target_group_arn = var.TARGET_GROUP_ARN
  target_id        = aws_instance.app.id
  port             = var.TARGET_GROUP_PORT
}