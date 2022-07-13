terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "dinhlehoangdemo-terraform-state"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}

# resource "aws_s3_bucket" "terraform_state-vpc" {
#   bucket = "dinhlehoangdemo-terraform-state-vpc"
#   versioning {
#     enabled = true
#   }
#   lifecycle {
#     prevent_destroy = true
#   }
# }