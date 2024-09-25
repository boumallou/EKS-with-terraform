
module "bucket-maintenance_uws-tech_com" {
  source = "../../modules/s3"
       providers = {
    aws = aws.Paris
  }
  s3_bucket-name = var.bucketnames[10]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = false
  RestrictPublicBuckets = true
  BlockPublicAcls = true
  IgnorePublicAcls = true
  isProd = true
  addPolicy = false
  bucket-policy = jsonencode("")
  tag = {
    Environment = var.environment
    Name = var.bucketnames[10]
    Application = "maintenance"
  }
}

#CFD = Cloudfront Distribution
module "CFD-bucket-maintenance_uws-tech_com" {
  source = "../../modules/cloudfront"
  S3OriginId = "S3-${var.bucketnames[10]}"
  Description = "Maintenance UWS Tech"
  IPV6_Enabled = true
  Alias = [var.bucketnames[10]]
  Bucket-domain-name = "${module.bucket-maintenance_uws-tech_com.bucket-domain-name}"
  lambda = null
  lambda_event_type = null
  certificat_arn = var.uex-tech_certificat_arn
  tls_protocol_version = "TLSv1.2_2019"
  ssl_method = "sni-only"
  add_edge_function = false
  CFD_error_response = []
  cache_behavior_default_ttl = 0
  cache_behavior_max_ttl = 0
  cache_behavior_viewer_policy = "redirect-to-https"
  cache_behavior_allowed_methods = ["GET", "HEAD"]
  cache_behavior_compress = false
  add_forwarded_value = true
  cache_policy = null
  add-origin-access_id = false
  origin-access_id = null
  origin-access_control = null
  default_certificat = false
  tag = {
    Environment = var.environment
    Application = "Maintenance UWS Tech"
  }
}
