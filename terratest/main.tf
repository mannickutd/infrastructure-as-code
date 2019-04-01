
module "vpc" {
  source = "../terraform/modules/vpc"

  env_name                = "${var.env_name}"
  vpc_name                = "${var.vpc_name}"
  vpc_cidr                = "${var.vpc_cidr}"
  azs                     = "${var.azs}"
  private_subnets         = "${var.private_subnets}"
  public_subnets          = "${var.public_subnets}"
  enable_dns_hostnames    = "${var.enable_dns_hostnames}"
  enable_dns_support      = "${var.enable_dns_support}"
  enable_nat_gateway      = "${var.enable_nat_gateway}"
  single_nat_gateway      = "true"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN EC2 INSTANCE RUNNING UBUNTU
# See test/terraform_aws_example_test.go for how to write automated tests for this code.
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "example" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id = "${module.vpc.private_subnets[0]}"

  tags {
    Name = "${var.instance_name}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# LOOK UP THE LATEST UBUNTU AMI
# ---------------------------------------------------------------------------------------------------------------------

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}