terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.region
}

module "aws_iam_user" {
  source = "../"

  name          = var.name
  force_destroy = var.force_destroy
  pgp_key       = var.pgp_key
  tags          = var.tags
}
