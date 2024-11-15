terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}

provider "tls" {
  
}