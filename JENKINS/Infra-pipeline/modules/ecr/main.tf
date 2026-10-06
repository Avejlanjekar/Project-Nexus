resource "aws_ecr_repository" "this_backend" {
  name                 = var.BACKEND_REPOSITORY_NAME
  image_tag_mutability = var.IMAGE_TAG_MUTABILITY
  image_scanning_configuration {
    scan_on_push = var.SCAN_ON_PUSH
  }
  encryption_configuration {
    encryption_type = var.ENCRYPTION_TYPE
  }
  tags = merge(var.COMMON_TAGS, {
    Name = var.BACKEND_REPOSITORY_NAME
  })
}


resource "aws_ecr_repository" "this_frontend" {
  name                 = var.FRONTEND_REPOSITORY_NAME
  image_tag_mutability = var.IMAGE_TAG_MUTABILITY
  image_scanning_configuration {
    scan_on_push = var.SCAN_ON_PUSH
  }
  encryption_configuration {
    encryption_type = var.ENCRYPTION_TYPE
  }
  tags = merge(var.COMMON_TAGS, {
    Name = var.FRONTEND_REPOSITORY_NAME
  })
}


resource "aws_ecr_repository" "this_database" {
  name                 = var.DATABASE_REPOSITORY_NAME
  image_tag_mutability = var.IMAGE_TAG_MUTABILITY
  image_scanning_configuration {
    scan_on_push = var.SCAN_ON_PUSH
  }
  encryption_configuration {
    encryption_type = var.ENCRYPTION_TYPE
  }
  tags = merge(var.COMMON_TAGS, {
    Name = var.DATABASE_REPOSITORY_NAME
  })
}
