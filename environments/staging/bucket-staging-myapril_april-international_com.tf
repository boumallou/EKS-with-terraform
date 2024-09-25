
module "bucket-staging-myapril_april-international_com" {
  source = "../../modules/s3"
     providers = {
    aws = aws.Paris
  }
  s3_bucket-name = var.bucketnames[32]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = true
  RestrictPublicBuckets = true
  BlockPublicAcls = true
  IgnorePublicAcls = true
  isProd = false
  addPolicy = true
  bucket-policy =  data.aws_iam_policy_document.bucket-policy-staging-myapril_april-international_com.json
  tag = {
    Environment = var.environment
    Name = var.bucketnames[32]
    Application = "myapril"
  }
}
data "aws_iam_policy_document" "bucket-policy-staging-myapril_april-international_com" {
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
        "arn:aws:s3:::${var.bucketnames[32]}/*",
    ]
  }

  statement {
    sid       = "AllowCloudFrontServicePrincipal"
    actions    = [
        "s3:GetObject"
    ]
    effect    = "Allow"
    principals {
        type = "Service"
        identifiers = ["cloudfront.amazonaws.com"]
    }
    resources  = [
        "arn:aws:s3:::${var.bucketnames[32]}/*",
    ]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = ["${module.CFD-bucket-staging-myapril_april-international_com.cfd_arn}"]
    }
    
  }
}
 #CFD = Cloudfront Distribution
 module "CFD-bucket-staging-myapril_april-international_com" {
   source = "../../modules/cloudfront"
   S3OriginId = "S3-${var.bucketnames[32]}"
   Description = "Staging - Selfcare Member"
   IPV6_Enabled = true
   Alias = null //[var.bucketnames[32]]
   Bucket-domain-name = "${module.bucket-staging-myapril_april-international_com.bucket-domain-name}" 
   lambda = null
   lambda_event_type = null
   certificat_arn = null
   tls_protocol_version = null
   ssl_method = null
   default_certificat = true
   add_edge_function = false
   CFD_error_response = [
     {
       error_caching_min_ttl = 10
       error_code            = 403
       response_code         = 200
       response_page_path    = "/index.html"
     },
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
   cache_policy = aws_cloudfront_cache_policy.AngularApplication.id
   add-origin-access_id = false
   origin-access_id = null
   origin-access_control = aws_cloudfront_origin_access_control.OAC.id
   tag = {
     Environment = var.environment
     Application = "Selfcare"
   }
 }