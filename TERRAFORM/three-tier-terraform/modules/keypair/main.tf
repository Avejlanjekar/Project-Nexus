resource "tls_private_key" "this_key" {
  algorithm = var.ALGORITHM
  rsa_bits  = var.RSA_BITS
}

resource "aws_key_pair" "this_key_pair" {
  key_name   = var.KEY_NAME
  public_key = tls_private_key.this_key.public_key_openssh
}

resource "local_file" "this_pem" {
  filename        = var.FILENAME
  content         = tls_private_key.this_key.private_key_pem
  file_permission = var.FILE_PERMISSION
}
