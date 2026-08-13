variable "LOG_GROUP_NAME" {
  type = string
}

variable "RETENTION_IN_DAYS" {
  type = number
}

variable "TAGS" {
  type = map(string)
}