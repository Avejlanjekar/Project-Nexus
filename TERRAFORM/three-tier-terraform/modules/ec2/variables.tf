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
