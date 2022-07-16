terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "dinhlehoangdemo-terraform-state-prod"
    key    = "services/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "services" {
  source = "git@github.com:hoangledinh65/terraform-module.git//services?ref=master"
  alb-name = "hoangdl-alb-prod"
  target-group-name = "hoangdl-tg-prod"
}

output "vpc-id" {
  value = module.services.vpc-id
}
