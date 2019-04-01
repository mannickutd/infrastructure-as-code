variable "env_name" {}
variable "vpc_name" {}
variable "vpc_cidr" {}

variable "azs" {
  type = "list"
}

variable "private_subnets" {
  type = "list"
}

variable "public_subnets" {
  type = "list"
}

variable "enable_nat_gateway" {}
variable "single_nat_gateway" {}

variable "one_nat_gateway_per_az" {
  default = false
}

variable "enable_s3_endpoint" {
  default = true
}

variable "enable_dns_hostnames" {
  default = true
}

variable "enable_dns_support" {
  default = true
}
