variable "environment" {
  description = "Environment type (dev, test, prod)"
  default = "dev"
}

variable "vpc_id" {
  description = "The VPC ID where the instance will be created"
  default = "vpc-094579365b61b900d"
}

variable "subnet_cidr" {
  description = "The subnet CIDR for the environment"
  default = "10.222.28.0/24"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  default = "ami-06b21ccaeff8cd686"
}

variable "key_name" {
  description = "Key name for SSH access"
  default = "ec2-dev-user28-key"
}