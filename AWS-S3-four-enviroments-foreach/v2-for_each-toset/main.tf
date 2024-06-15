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


# Create 4 IAM Users
resource "aws_iam_user" "myuser" {
  for_each = toset( ["Jack", "James", "Madhu", "Dave"] )
  name     = each.key
}