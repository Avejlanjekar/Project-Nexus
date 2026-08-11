variable "VPC_CIDR_BLOCK" {
  type = string
}

variable "ENABLE_DNS_HOSTNAMES" {
  type = bool
}

variable "ENABLE_DNS_SUPPORT" {
  type = bool
}

variable "VPC_NAME" {
  type = string
}

variable "IGW_NAME" {
  type = string
}

variable "PUBLIC_SUBNET_CIDRS" {
  type = list(string)
}

variable "AVAILABILITY_ZONES" {
  type = list(string)
}

variable "APP_SUBNET_CIDRS" {
  type = list(string)
}

variable "DB_SUBNET_CIDRS" {
  type = list(string)
}
//public route table cidr i.e "0.0.0.0/0"
variable "PUBLIC_ROUTE_CIDR" {
  type = string
}

variable "PUBLIC_RT_NAME" {
  type = string
}

variable "PRIVATE_RT_NAME" {
  type = string
}

variable "EIP_NAME" {
  type = string
}

variable "NAT_GATEWAY_NAME" {
  type = string
}



variable "PRIVATE_ROUTE_CIDR" {
  type = string
}

variable "DATABASE_RT_NAME" {
  type = string
}

variable "VPC_COMMON_TAGS" {
  type = map(string)
}