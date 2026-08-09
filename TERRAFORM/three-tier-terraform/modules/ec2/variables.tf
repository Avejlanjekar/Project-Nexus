variable "AMI" {
  type = string
}

variable "INSTANCE_TYPE" {
  type = string
}

variable "SUBNET_ID" {
  type = string
}

variable "APP_SG_ID" {
  type = string
}

variable "KEY_NAME" {
  type = string
}

variable "INSTANCE_NAME" {
  type = string
}

variable "TARGET_GROUP_ARN" {
  type = string
}


variable "TARGET_GROUP_PORT" {
  type    = number
  default = 80
}


variable "GITHUB_REPO" {
  type = string
}

variable "DB_HOST" {
  type = string
}

variable "DB_USER" {
  type = string
}

variable "DB_PASSWORD" {
  type      = string
  sensitive = true
}

variable "DB_NAME" {
  type = string
}