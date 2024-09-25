
module "bucket-producer_april-international_com" {
  source = "../../modules/s3"
  s3_bucket-name = var.bucketnames[34]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = false
  RestrictPublicBuckets = false
  BlockPublicAcls = false
  IgnorePublicAcls = false
  isProd = true
  addPolicy = true
  bucket-policy =  data.aws_iam_policy_document.bucket-policy-producer_april-international_com.json
  tag = {
    Environment = var.environment
    Name = var.bucketnames[34]
    Application = "Selfcare"
  }
}
data "aws_iam_policy_document" "bucket-policy-producer_april-international_com" {
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
        "arn:aws:s3:::${var.bucketnames[34]}/*",
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
        "arn:aws:s3:::${var.bucketnames[34]}/*",
    ]
    
  }
}

#CFD = Cloudfront Distribution
module "CFD-bucket-producer_april-international_com" {
  source = "../../modules/cloudfront"
  S3OriginId = "producer.april-international.com.s3.ap-southeast-1.amazonaws.com"
  Description = "Production - Selfcare Producer"
  IPV6_Enabled = true
  Alias = [var.bucketnames[34]]
  Bucket-domain-name = "producer.april-international.com.s3.ap-southeast-1.amazonaws.com"
  lambda = null
  lambda_event_type = null
  certificat_arn = var.april_international_certificat_arn
  tls_protocol_version = "TLSv1.2_2021"
  ssl_method = "sni-only"
  add_edge_function = false
    CFD_error_response = [
    #response1
    {
      error_caching_min_ttl = 10
      error_code            = 403
      response_code         = 200
      response_page_path    = "/index.html"
    },
    #response2
    {
      error_caching_min_ttl = 10
      error_code            = 404
      response_code         = 200
      response_page_path    = "/index.html"
    }
  ]
  cache_behavior_default_ttl = 0
  cache_behavior_max_ttl = 0
  cache_behavior_viewer_policy = "redirect-to-https"
  cache_behavior_allowed_methods = ["GET", "HEAD"]
  cache_behavior_compress = true
  add_forwarded_value = false
  cache_policy = var.Managed-CachingOptimized-policy
  add-origin-access_id = false
  origin-access_id = null
  origin-access_control = null
  default_certificat = false
  tag = {
    Environment = var.environment
    Application = "Selfcare"
  }
}