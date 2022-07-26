terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "dinhlehoangdemo-terraform-state-testing"
    key    = "security/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "kms" {
  source = "git@github.com:hoangledinh65/terraform-module.git//security?ref=testing"
}

output "key-id" {
  value = module.kms.key-id
}