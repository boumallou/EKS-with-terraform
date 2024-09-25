
module "bucket-backoffice_uexglobal_com" {
  source = "../../modules/s3"
  s3_bucket-name = var.bucketnames[7]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = false
  RestrictPublicBuckets = false
  BlockPublicAcls = false
  IgnorePublicAcls = false
  isProd = true
  addPolicy = true
  bucket-policy =  data.aws_iam_policy_document.bucket-policy-backoffice_uexglobal_com.json
  tag = {
    Environment = var.environment
    Name = var.bucketnames[7]
    Application = "Backoffice"
  }
}
data "aws_iam_policy_document" "bucket-policy-backoffice_uexglobal_com" {
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
        "arn:aws:s3:::${var.bucketnames[7]}/*",
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
        "arn:aws:s3:::${var.bucketnames[7]}/*",
    ]
    
  }
}
#CFD = Cloudfront Distribution
module "CFD-bucket-backoffice_uexglobal_com" {
  source = "../../modules/cloudfront"
  S3OriginId = "S3-${var.bucketnames[7]}"
  Description = "Frontend Backoffice Production"
  IPV6_Enabled = true
  Alias = [var.bucketnames[7]]
  Bucket-domain-name = "${module.bucket-backoffice_uexglobal_com.bucket-domain-name}"
  lambda = null
  lambda_event_type = null
  certificat_arn = var.uexglobal_com_certificat_arn
  tls_protocol_version = "TLSv1.1_2016"
  ssl_method = "sni-only"
  add_edge_function = false
  CFD_error_response = [
    #response1
    {
      error_caching_min_ttl = 300
      error_code            = 403
      response_code         = 200
      response_page_path    = "/index.html"
    }
  ]
  cache_behavior_default_ttl = 86400
  cache_behavior_max_ttl = 31536000
  cache_behavior_viewer_policy = "redirect-to-https"
  cache_behavior_allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  cache_behavior_compress = false
  add_forwarded_value = true
  cache_policy = null
  add-origin-access_id = false
  origin-access_id = null
  origin-access_control = null
  default_certificat = false
  tag = {
    Environment = var.environment
    Application = "Backoffice"
  }
}
