terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.58.0"

    }
  }
}

# Configure the AWS Provider - Region Singapour
provider "aws" {
  region = "ap-southeast-1"
}

# Configure the AWS Provider - Region Paris
provider "aws" {
  region = "eu-west-3"
  alias = "Paris"
}

# Configure the AWS Provider - Virginia Region
provider "aws" {
  region = "us-east-1"
  alias = "Virginia"
}