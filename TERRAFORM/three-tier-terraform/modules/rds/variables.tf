variable "DB_SUBNET_GROUP_NAME" {
  type = string
}

variable "DB_SUBNET_IDS" {
  type = list(string)
}

variable "IDENTIFIER" {
  type    = string
  default = "three-tier-db"
}

variable "ENGINE" {
  type = string
}

variable "ENGINE_VERSION" {
  type = string
}

variable "INSTANCE_CLASS" {
  type = string
}

variable "ALLOCATED_STORAGE" {
  type = number
}

variable "DB_NAME" {
  type = string
}

variable "USERNAME" {
  type = string
}

variable "PASSWORD" {
  type      = string
  sensitive = true
}

variable "DB_SG_ID" {
  type = string
}

variable "PUBLICLY_ACCESSIBLE" {
  type = bool
}

variable "SKIP_FINAL_SNAPSHOT" {
  type = bool
}

variable "DB_COMMON_TAGS" {
  type = map(string)
}