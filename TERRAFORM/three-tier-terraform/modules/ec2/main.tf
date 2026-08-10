resource "aws_instance" "app" {
  ami                    = var.AMI
  instance_type          = var.INSTANCE_TYPE
  subnet_id              = var.SUBNET_ID
  vpc_security_group_ids = [var.APP_SG_ID]
  key_name               = var.KEY_NAME
  iam_instance_profile   = var.IAM_INSTANCE_PROFILE
  user_data = templatefile("${path.module}/user_data.sh", {
    GITHUB_REPO = var.GITHUB_REPO
    DB_HOST     = var.DB_HOST
    DB_USER     = var.DB_USER
    DB_PASSWORD = var.DB_PASSWORD
    DB_NAME     = var.DB_NAME
  })
  tags = {
    Name = var.INSTANCE_NAME
  }
}

resource "aws_lb_target_group_attachment" "app" {
  target_group_arn = var.TARGET_GROUP_ARN
  target_id        = aws_instance.app.id
  port             = var.TARGET_GROUP_PORT
}
