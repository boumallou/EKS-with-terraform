
module "bucket-myhealth-sg_april_asia" {
  source = "../../modules/s3"
  s3_bucket-name = var.bucketnames[3]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = true
  RestrictPublicBuckets = true
  BlockPublicAcls = true
  IgnorePublicAcls = true
  isProd = true
  addPolicy = true
  bucket-policy =  data.aws_iam_policy_document.bucket-policy-myhealth-sg_april_asia.json
  tag = {
    Environment = var.environment
    Name = var.bucketnames[3]
    Application = "myhealth"
  }
}
data "aws_iam_policy_document" "bucket-policy-myhealth-sg_april_asia" {
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
        "arn:aws:s3:::${var.bucketnames[3]}/*",
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
        "arn:aws:s3:::${var.bucketnames[3]}/*",
    ]
    
  }
}
#CFD = Cloudfront Distribution
# module "CFD-bucket-myhealth-sg_april_asia" {
#   source = "../../modules/cloudfront"
#   S3OriginId = "S3-${var.bucketnames[3]}"
#   Description = "APRIL SG FRONTEND PRODUCTION"
#   IPV6_Enabled = true
#   Alias = [var.bucketnames[3]]
#   Bucket-domain-name = "${module.bucket-myhealth-sg_april_asia.bucket-domain-name}"
#   lambda = null
#   lambda_event_type = null
#   certificat_arn = var.april_asia_certificat_arn
#   tls_protocol_version = "TLSv1.1_2016"
#   ssl_method = "sni-only"
#   add_edge_function = false
#   CFD_error_response = [
#     #response1
#     {
#       error_caching_min_ttl = 300
#       error_code            = 403
#       response_code         = 200
#       response_page_path    = "/index.html"
#     }
#   ]
#    cache_behavior_default_ttl = 86400
#    cache_behavior_max_ttl = 31536000
#    cache_behavior_viewer_policy = "redirect-to-https"
#    cache_behavior_allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
#    cache_behavior_compress = false
#    add_forwarded_value = true
#    cache_policy = null
#    add-origin-access_id = false
#    origin-access_id = null
#    origin-access_control = null
#    default_certificat = false
#    tag = {
#     Environment = var.environment
#     Application = "MyHealthSG"
#   }
# }
