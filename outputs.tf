output "dev_ec2_public_ip" {
  value = module.dev.public_ip
}

output "test_ec2_public_ip" {
  value = module.test.public_ip
}

output "prod_ec2_public_ip" {
  value = module.prod.public_ip
}

output "vpc_id" {
  value = "vpc-094579365b61b900d"
}

output "vpc_cidr_block" {
  value = "10.222.0.0/16"
}