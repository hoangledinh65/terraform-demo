terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "dinhlehoangdemo-terraform-state"
    key            = "services/terraform.tfstate"
    region         = "ap-southeast-1"
    # dynamodb_table = "hoangdl-locks"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "hoangdl-amz-ec2" {
  count         = 1
  ami           = "ami-0c802847a7dd848c0"
  instance_type = "t2.micro"

  tags = {
    Name = "hoangdl-amz-ec223"
  }
}
