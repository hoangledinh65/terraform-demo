terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "dinhlehoangdemo-terraform-state-dev"
    key            = "services/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "hoangdl-locks"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}


module "services" {
  source = "git@github.com:hoangledinh65/modules.git//services"
  isCreated = true
}
