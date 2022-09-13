terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.18.0"
    }
  }

  backend "s3" {
    bucket = "dojoeman"
    key = "state-file/terraform.tfstate"
    dynamodb_table = ""
    region = "us-east-1"

  }
  
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}