resource "aws_ecr_repository" "this_ecr" {
  name                 = var.REPOSITORY_NAME
  image_tag_mutability = var.IMAGE_TAG_MUTABILITY
  image_scanning_configuration {
    scan_on_push = var.SCAN_ON_PUSH
  }
  tags = merge(var.COMMON_TAGS, {
    NAME = var.REPOSITORY_NAME
  })
}