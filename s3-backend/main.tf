terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "hoangdl-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
resource "aws_s3_bucket" "terraform_state-staging" {
  bucket = "dinhlehoangdemo-terraform-state-staging"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "terraform-state-prod" {
  bucket = "dinhlehoangdemo-terraform-state-prod"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_s3_bucket" "terraform-state-testing" {
  bucket = "dinhlehoangdemo-terraform-state-testing"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_s3_bucket" "terraform-state-dev" {
  bucket = "dinhlehoangdemo-terraform-state-dev"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}