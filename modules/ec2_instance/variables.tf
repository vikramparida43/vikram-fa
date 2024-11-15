variable "environment" {
  description = "Environment type (dev, test, prod)"
  type        = string
  #default = "not known"
}

variable "vpc_id" {
  description = "The VPC ID where the instance will be created"
  type        = string
  #default = "not known"
}

variable "subnet_cidr" {
  description = "The subnet CIDR for the environment"
  type        = string
  #default = "not known"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  #default = "ami-06b21ccaeff8cd686"
}

variable "key_name" {
  description = "Key name for SSH access"
  type        = string
  #default = "not known"
}