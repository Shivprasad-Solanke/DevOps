terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "new-bucket-shivprasad-102"
    key = "terrform/aws_lambda_function/terraform.tfstate"
    region = "ap-south-1"
  }
}