variable "REPOSITORY_NAME" {
  type = string
}

variable "COMMON_TAGS" {
  type = map(string)
}

variable "IMAGE_TAG_MUTABILITY" {
  type = string
}

variable "SCAN_ON_PUSH" {
  type    = bool
  default = true
}