terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "dinhlehoangdemo-terraform-state-testing"
    key    = "services/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "services" {
  source = "git@github.com:hoangledinh65/terraform-module.git//services?ref=testing"
  alb-name = "hoangdl-alb-testing"
  target-group-name = "hoangdl-tg-testing"
  lambda-function-name = "hoangdl"
  env = "testing"
}

output "vpc-id" {
  value = module.services.vpc-id
}
output "ec2-ip0" {
  value = module.services.ec2-ip0
}
output "ec2-ip1" {
  value = module.services.ec2-ip1
}
