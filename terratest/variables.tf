# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "env_name" {
    default = "dev"
}

variable "region" {
    default = "us-west-2"    
}

variable "vpc_name" {
    default = "default-vpc"
}

variable "vpc_cidr" {
    default = "10.180.0.0/16"
}

variable "azs" {
  type = "list"
  default = ["us-west-2a"]
}

variable "private_subnets" {
  type = "list"
  default = ["10.180.8.0/21"]
}

variable "public_subnets" {
  type = "list"
  default = ["10.180.32.0/21"]
}

variable "enable_nat_gateway" {
    default = "true"
}
variable "single_nat_gateway" {
    default = "true"
}

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

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "instance_name" {
  description = "The Name tag to set for the EC2 Instance."
  default     = "terratest-example"
}