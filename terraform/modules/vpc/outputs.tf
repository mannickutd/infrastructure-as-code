output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "private_subnets" {
  value = "${module.vpc.private_subnets}"
}

output "public_subnets" {
  value = "${module.vpc.public_subnets}"
}

output "nat_eips_public_ips" {
  value = "${module.vpc.nat_public_ips}"
}

output "natgw_ids" {
  value = "${module.vpc.natgw_ids}"
}