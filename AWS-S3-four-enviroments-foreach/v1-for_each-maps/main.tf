# Terraform Block
terraform {
  required_version = "> 0.14.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}


# Create S3 Bucket per environment with for_each and maps
resource "aws_s3_bucket" "mys3bucketSebastianBerrospe" {

  for_each = {
    dev  = "my-dapp-bucket"
    qa   = "my-qapp-bucket"
    stag = "my-sapp-bucket"
    prod = "my-papp-bucket"
  }

  bucket = "${each.key}-${each.value}"
  acl    = "private"

  tags = {
    eachvalue   = each.value
    Environment = each.key
    bucketname  = "${each.key}-${each.value}-JSB-Devops"
  }
}