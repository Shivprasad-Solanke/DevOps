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
    bucket = "new-bucket-shivprasad-102"    # Replace with your S3 bucket name
    key    = "terraform.tfstate"  # The path within the bucket where the state will be stored
    region = "ap-south-1"                     # AWS region of the S3 bucket
  }
}