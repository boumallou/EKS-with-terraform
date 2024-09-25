
module "bucket-docs_uexglobal_com" {
  source = "../../modules/s3"
  s3_bucket-name = var.bucketnames[39]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = true
  RestrictPublicBuckets = true
  BlockPublicAcls = true
  IgnorePublicAcls = true
  isProd = true
  addPolicy = false
  bucket-policy =  jsonencode("")
  tag = {
    Environment = var.environment
    Name = var.bucketnames[39]
    Application = "docs"
  }
}

#CFD = Cloudfront Distribution
module "CFD-bucket-docs_uexglobal_com" {
  source = "../../modules/cloudfront"
  S3OriginId = "S3-${var.bucketnames[39]}"
  Description = "UEX Documents"
  IPV6_Enabled = true
  Alias = [var.bucketnames[39]]
  Bucket-domain-name = "${module.bucket-docs_uexglobal_com.bucket-domain-name}"
  lambda = null
  lambda_event_type = null
  certificat_arn = var.uexglobal_com_certificat_arn
  tls_protocol_version = "TLSv1.1_2016"
  ssl_method = "sni-only"
  add_edge_function = false
  CFD_error_response = []
  cache_behavior_default_ttl = 86400
  cache_behavior_max_ttl = 31536000
  cache_behavior_viewer_policy = "redirect-to-https"
  cache_behavior_allowed_methods = ["GET", "HEAD"]
  cache_behavior_compress = false
  add_forwarded_value = true
  cache_policy = null
  add-origin-access_id = true
  origin-access_control = null
  default_certificat = false
  origin-access_id = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
  tag = {
    Environment = var.environment
    Application = "docs"
  }
}
