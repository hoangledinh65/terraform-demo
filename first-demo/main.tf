terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "dinhlehoangdemo-terraform-state"
    key    = "./terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "hoangdl-amz-ec2" {
  ami                    = "ami-0c802847a7dd848c0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.hoangdl-sg.id]
  key_name = aws_key_pair.publickey.key_name

  tags = {
    Name = "hoangdl-amz-ec2"
  }
}
