
module "bucket-staging-redirection-legacy_uexglobal_com" {
  source = "../../modules/s3"
  s3_bucket-name = var.bucketnames[37]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = true
  RestrictPublicBuckets = true
  BlockPublicAcls = true
  IgnorePublicAcls = true
  isProd = true
  addPolicy = false
  bucket-policy = jsonencode("")
  tag = {
    Environment = var.environment
    Name = var.bucketnames[37]
    Application = "redirection"
  }
}
#CFD = Cloudfront Distribution
# module "CFD-bucket-redirection-legacy_uexglobal_com" {
#   source = "../../modules/cloudfront"
#   S3OriginId = "S3-${var.bucketnames[37]}"
#   Description = "Redirection Old Website"
#   IPV6_Enabled = true
#   Alias = ["app.uexglobal.com","m.uexglobal.com"]
#   Bucket-domain-name = "${module.bucket-redirection-legacy_uexglobal_com.bucket-domain-name}"
#   lambda = "${module.lambda-maintenanceRedirection.lambda_arn}"
#   lambda_event_type = "origin-request"
#   certificat_arn = var.uexglobal_com_certificat_arn
#   tls_protocol_version = "TLSv1.2_2018"
#   ssl_method = "sni-only"
#   add_edge_function = true
#   CFD_error_response = []
#   cache_behavior_default_ttl = 86400
#   cache_behavior_max_ttl = 31536000
#   cache_behavior_viewer_policy = "redirect-to-https"
#   cache_behavior_allowed_methods = ["GET", "HEAD"]
#   cache_behavior_compress = false
#   add_forwarded_value = true
#   cache_policy = null
#   add-origin-access_id = false
#   origin-access_id = null
#   tag = {
#     Environment = var.environment
#     Application = "Redirection"
#   }
# }

