module "dev" {
  source          = "./modules/ec2_instance"
  environment     = "dev"
  vpc_id          = "vpc-094579365b61b900d"
  subnet_cidr     = "10.222.28.0/24"
  ami             = "ami-06b21ccaeff8cd686"
  key_name        = "dev-key"
}

module "test" {
  source          = "./modules/ec2_instance"
  environment     = "test"
  vpc_id          = "vpc-094579365b61b900d"
  subnet_cidr     = "10.222.128.0/24"
  ami             = "ami-06b21ccaeff8cd686"
  key_name        = "test-key"
}

module "prod" {
  source          = "./modules/ec2_instance"
  environment     = "prod"
  vpc_id          = "vpc-094579365b61b900d"
  subnet_cidr     = "10.222.228.0/24"
  ami             = "ami-06b21ccaeff8cd686"
  key_name        = "prod-key"
}