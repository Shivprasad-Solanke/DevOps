terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "new-bucket-shivprasad-102"
    key = "terrform/aws_s3/terraform.tfstate"
    region = "ap-south-1"
  }
}