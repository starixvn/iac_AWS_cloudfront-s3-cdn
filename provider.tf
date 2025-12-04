terraform {
  required_version = ">= 1.3"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.8.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.9"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.2"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.7"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "aws-main"
}
