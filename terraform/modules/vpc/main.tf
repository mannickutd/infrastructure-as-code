# Sets up Amazon VPC, public/private subnets, routing tables, NAT, IGW

module "vpc" {
  source = "github.com/DigitalGenius/terraform-aws-vpc"

  name                   = "${var.env_name}-${var.vpc_name}"
  cidr                   = "${var.vpc_cidr}"
  azs                    = "${var.azs}"
  private_subnets        = "${var.private_subnets}"
  public_subnets         = "${var.public_subnets}"
  single_nat_gateway     = "${var.single_nat_gateway}"
  one_nat_gateway_per_az = "${var.one_nat_gateway_per_az}"
  enable_s3_endpoint     = "${var.enable_s3_endpoint}"
  enable_nat_gateway     = "${var.enable_nat_gateway}"
  enable_dns_hostnames   = "${var.enable_dns_hostnames}"
  enable_dns_support     = "${var.enable_dns_support}"

  tags {
    "Environment" = "${var.env_name}"
  }
}
