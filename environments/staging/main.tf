# Define Terraform Backend for Staging environment
terraform {
   backend "s3" {
    bucket = "terraform-backend-uex-staging"
    key    = "state/staging.tfstate"
    region = "ap-southeast-1"
    encrypt = true
    dynamodb_table = "terraform_lock_table"
  } 
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "AICF static content"
}
resource "aws_cloudfront_origin_access_control" "OAC" {
  name                              = "OAC"
  description                       = "origin access control"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
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

resource "aws_vpc_endpoint" "ssm-endpoint" {
  vpc_id       = "${module.vpc-staging-asia.VPC.id}"
  service_name = "com.amazonaws.ap-southeast-1.ssm"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids        = ["${module.vpc-staging-asia.private_subnets_id[0]}"]
  security_group_ids = ["${module.octnis-staging-ec2-sg.sg_id}"]
  tags = {
    Name = "ssm-endpoint"
  }
}
resource "aws_vpc_endpoint" "ssm-ec2messages" {
  vpc_id       = "${module.vpc-staging-asia.VPC.id}"
  service_name = "com.amazonaws.ap-southeast-1.ec2messages"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids        = ["${module.vpc-staging-asia.private_subnets_id[0]}"]
  security_group_ids = ["${module.octnis-staging-ec2-sg.sg_id}"]
  tags = {
    Name = "ssm-ec2messages"
  }
}
resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id       = "${module.vpc-staging-asia.VPC.id}"
  service_name = "com.amazonaws.ap-southeast-1.ssmmessages"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids        = ["${module.vpc-staging-asia.private_subnets_id[0]}"]
  security_group_ids = ["${module.octnis-staging-ec2-sg.sg_id}"]
  tags = {
    Name = "ssmmessages"
  }
}

resource "aws_vpc_endpoint" "CloudwatchLogs" {
  vpc_id       = "${module.vpc-staging-asia.VPC.id}"
  service_name = "com.amazonaws.ap-southeast-1.logs"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids        = ["${module.vpc-staging-asia.private_subnets_id[0]}"]
  security_group_ids = ["${module.octnis-staging-ec2-sg.sg_id}"]
  tags = {
    Name = "CloudwatchLogs"
  }
}
resource "aws_vpc_endpoint" "secretsmanager" {
  vpc_id       = "${module.vpc-staging-asia.VPC.id}"
  service_name = "com.amazonaws.ap-southeast-1.secretsmanager"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids        = ["${module.vpc-staging-asia.private_subnets_id[0]}"]
  security_group_ids = ["${module.octnis-staging-ec2-sg.sg_id}"]
  tags = {
    Name = "secretsmanager"
  }
}