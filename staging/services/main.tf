terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "dinhlehoangdemo-terraform-state"
    key    = "services/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "hoangdl-amz-ec2" {
  count                  = 1
  ami                    = "ami-0c802847a7dd848c0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.terraform_remote_state.security_group.outputs.sg-id]
  key_name               = aws_key_pair.publickey.key_name

  tags = {
    Name = "hoangdl-amz-ec223"
  }
}

data "terraform_remote_state" "security_group" {
  backend = "s3"

  config = {
    bucket = "dinhlehoangdemo-terraform-state"
    key    = "vpc/terraform.tfstate"
    region = "ap-southeast-1"   
  }
}
# data "aws_security_group" "sg" {
#   name = "hoangdl-sg"
# }
output "abc" {
  value = data.terraform_remote_state.security_group.outputs.sg-id
}