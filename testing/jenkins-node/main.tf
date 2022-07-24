terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "dinhlehoangdemo-terraform-state-testing"
    key    = "jenkins-node/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "jenkins-node" {
  source = "git@github.com:hoangledinh65/terraform-module.git//jenkins-node?ref=testing"
  bucket = "dinhlehoangdemo-terraform-state-testing"
}

output "vpc-id" {
  value = module.jenkins-node.vpc-id
}
output "agent-ip" {
  value = module.jenkins-node.agent-ip
}