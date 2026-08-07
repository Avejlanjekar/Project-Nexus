resource "aws_db_subnet_group" "this_db_subnet_grp" {
  name       = var.DB_SUBNET_GROUP_NAME
  subnet_ids = var.DB_SUBNET_IDS
  tags = {
    Name = var.DB_SUBNET_GROUP_NAME
  }
}

resource "aws_db_instance" "this_rds_db" {
  identifier        = var.IDENTIFIER
  engine            = var.ENGINE
  engine_version    = var.ENGINE_VERSION
  instance_class    = var.INSTANCE_CLASS
  allocated_storage = var.ALLOCATED_STORAGE

  db_name              = var.DB_NAME
  username             = var.USERNAME
  password             = var.PASSWORD
  db_subnet_group_name = aws_db_subnet_group.this_db_subnet_grp.name

  vpc_security_group_ids = [var.DB_SG_ID]
  publicly_accessible    = var.PUBLICLY_ACCESSIBLE
  skip_final_snapshot    = var.SKIP_FINAL_SNAPSHOT

  tags = {
    Name = var.IDENTIFIER
  }
}

