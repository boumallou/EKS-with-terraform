
module "bucket-staging-axa-payment_uexglobal_com" {
  source = "../../modules/s3"
  s3_bucket-name = var.bucketnames[24]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = false
  RestrictPublicBuckets = false
  BlockPublicAcls = false
  IgnorePublicAcls = false
  isProd = false
  addPolicy = true
  bucket-policy =  data.aws_iam_policy_document.bucket-policy-staging-axa-payment_uexglobal_com.json
  tag = {
    Environment = var.environment
    Name = var.bucketnames[24]
    Application = "AXA"
  }
}

data "aws_iam_policy_document" "bucket-policy-staging-axa-payment_uexglobal_com" {
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
        "arn:aws:s3:::${var.bucketnames[24]}/*",
    ]
  }

  statement {
    sid       = "1"
    actions    = [
        "s3:GetObject"
    ]
    effect    = "Allow"
    principals {
        type = "AWS"
        identifiers = ["${aws_cloudfront_origin_access_identity.oai.iam_arn}"]
    }
    resources  = [
        "arn:aws:s3:::${var.bucketnames[24]}/*",
    ]
    
  }
}
# #CFD = Cloudfront Distribution
# module "CFD-bucket-axa-payment_uexglobal_com" {
#   source = "../../modules/cloudfront"
#   S3OriginId = "axa-payment.uexglobal.com.s3.ap-southeast-1.amazonaws.com"
#   Description = "Production - AXA Pay"
#   IPV6_Enabled = true
#   Alias = [var.bucketnames[24]]
#   Bucket-domain-name = "axa-payment.uexglobal.com.s3.ap-southeast-1.amazonaws.com"
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
#   cache_behavior_allowed_methods = ["GET", "HEAD"]
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

