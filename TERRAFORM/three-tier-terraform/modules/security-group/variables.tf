variable "VPC_ID" {
  type = string
}

variable "SG_NAME" {
  type = string
}

variable "PORTS" {
  type = list(number)
}

variable "CIDR_BLOCKS" {
  type = list(string)
}