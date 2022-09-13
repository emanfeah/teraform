terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.18.0"
    }
  }
  
}


# Configure the AWS Provider region 
provider "aws" {
  region = "us-east-1"
}