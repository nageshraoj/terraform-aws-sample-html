terraform {
  required_version = "~> 1.0"
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "~> 3.44"
    }
  }
  # backend "s3" {
  #    bucket = "nagesh-070921"
  #    key = "workspace/terraform.tfstate"
  #    region = "us-east-2"
  #    dynamodb_table = "demostate"
  # } 
}

provider "aws" {
  # profile = "default"
  # region = "us-east-2"
}