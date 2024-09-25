
module "bucket-staging-axa-pay_uexglobal_com" {
  source = "../../modules/s3"
  s3_bucket-name = var.bucketnames[52]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = true
  RestrictPublicBuckets = true
  BlockPublicAcls = true
  IgnorePublicAcls = true
  isProd = false
  addPolicy = true
  bucket-policy =  data.aws_iam_policy_document.bucket-policy-staging-axa-pay_uexglobal_com.json
  tag = {
    Environment = var.environment
    Name = var.bucketnames[52]
    Application = "AXA"
  }
}
data "aws_iam_policy_document" "bucket-policy-staging-axa-pay_uexglobal_com" {
statement {
    sid = "PublicReadGetObject"
    effect    = "Allow"
    principals {
      type = "*"
      identifiers = ["*"]
    }
    actions = [
        "s3:GetObject",
    ]
    resources = [
        "arn:aws:s3:::${var.bucketnames[52]}/*",
    ]
  }

  statement {
    sid       = "2"
    actions    = [
        "s3:GetObject"
    ]
    effect    = "Allow"
    principals {
        type = "AWS"
        identifiers = ["${aws_cloudfront_origin_access_identity.oai.iam_arn}"]
    }
    resources  = [
        "arn:aws:s3:::${var.bucketnames[52]}/*",
    ]
    
  }
}
#CFD = Cloudfront Distribution
# module "CFD-bucket-axa-pay_uexglobal_com" {
#   source = "../../modules/cloudfront"
#   S3OriginId = "axa-pay.uexglobal.com.s3.ap-southeast-1.amazonaws.com"
#   Description = "Staging - AXA Pay"
#   IPV6_Enabled = true
#   Alias = [var.bucketnames[52]]
#   Bucket-domain-name = "axa-pay.uexglobal.com.s3.ap-southeast-1.amazonaws.com"
#   lambda = null
#   lambda_event_type = null
#   certificat_arn = var.uexglobal_com_certificat_arn
#   tls_protocol_version = "TLSv1.2_2021"
#   ssl_method = "sni-only"
#   add_edge_function = false
#   CFD_error_response = []
#   cache_behavior_default_ttl = 0
#   cache_behavior_max_ttl = 0
#   cache_behavior_viewer_policy = "https-only"
#   cache_behavior_allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
#   cache_behavior_compress = true
#   add_forwarded_value = false
#   cache_policy = var.Managed-CachingOptimized-policy
#   add-origin-access_id = false
#   origin-access_id = null
#   tag = {
#     Environment = var.environment
#     Application = "AXA"
#   }

# }

