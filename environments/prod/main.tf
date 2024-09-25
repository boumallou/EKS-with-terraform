# Define Terraform Backend for Prod environemnt
terraform {
   backend "s3" {
    bucket = "terraform-backend-uex-prod"
    key    = "state/prod.tfstate"
    region = "ap-southeast-1"
    encrypt = true
    dynamodb_table = "terraform_lock_table"
  } 
}

resource "aws_cloudfront_origin_access_identity" "oai" {
comment = "UEX static content"
}
resource "aws_cloudfront_origin_access_identity" "oai2" {
comment = "access-identity-cloudfront"
}

module "iam_role_access_cloudfront_website" {
  source = "../../modules/iam-policy/iam-lambda-role"
  RoleName = "access-cloudfront-website"
}

resource "aws_cloudfront_cache_policy" "AngularApplication" {
  name        = "AngularApplication"
  comment     = "Every hour Cache: MTTL 600 / MaxTTL 3600 / DefaultTTL 1800"
  default_ttl = 1800
  max_ttl     = 3600
  min_ttl     = 600
  parameters_in_cache_key_and_forwarded_to_origin {
    enable_accept_encoding_brotli = true
    enable_accept_encoding_gzip   = true
    cookies_config {
      cookie_behavior = "none"
    }
    headers_config {
      header_behavior = "none"
    }
    query_strings_config {
      query_string_behavior = "none"
  }
}
}
resource "aws_ec2_managed_prefix_list" "Bastion-User-UEX" {
  name           = "Bastion User UEX"
  address_family = "IPv4"
  max_entries    = 20

  entry {
    cidr        = "0.0.0.0/0"
    description = "A modifier"
  }

  tags = {
    Role = "Bastion"
  }
}
data "aws_caller_identity" "current" {}