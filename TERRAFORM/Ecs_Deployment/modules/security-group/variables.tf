variable "VPC_ID" {
  type = string
}

variable "SG_NAME" {
  type = string
}

variable "INGRESS_PORTS" {
  type = list(number)
}

variable "INGRESS_CIDR_BLOCKS" {
  type = list(string)
}

variable "EGRESS_PORTS" {
  type = list(number)
}

variable "EGRESS_CIDR_BLOCKS" {
  type = list(string)
}