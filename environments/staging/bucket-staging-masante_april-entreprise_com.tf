
module "bucket-staging-masante_april-entreprise_com" {
  source = "../../modules/s3"
     providers = {
    aws = aws.Paris
  }
  s3_bucket-name = var.bucketnames[17]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = false
  RestrictPublicBuckets = false
  BlockPublicAcls = false
  IgnorePublicAcls = false
  isProd = false
  addPolicy = true
  bucket-policy =  data.aws_iam_policy_document.bucket-policy-staging-masante_april-entreprise_com.json
  tag = {
    Environment = var.environment
    Name = var.bucketnames[17]
    Application = "masante"
  }
}
data "aws_iam_policy_document" "bucket-policy-staging-masante_april-entreprise_com" {
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
        "arn:aws:s3:::${var.bucketnames[17]}/*",
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
        "arn:aws:s3:::${var.bucketnames[17]}/*",
    ]
    
  }
}

# module "CFD-bucket-masante_april-entreprise_com" {
#   source = "../../modules/cloudfront"
#   S3OriginId = "S3-${var.bucketnames[17]}"
#   Description = "April Enterprise Production"
#   IPV6_Enabled = true
#   Alias = [var.bucketnames[17]]
#   Bucket-domain-name = "${module.bucket-masante_april-entreprise_com.bucket-domain-name}"
#   certificat_arn = var.masante_april-entreprise_certificat_arn
#   tls_protocol_version = "TLSv1.2_2019"
#   ssl_method = "sni-only"
#   add_edge_function = false
#   lambda = null
#   lambda_event_type = null
#   CFD_error_response = [
#     #response1
#     {
#       error_caching_min_ttl = 10
#       error_code            = 403
#       response_code         = 200
#       response_page_path    = "/index.html"
#     },
#        {
#       error_caching_min_ttl = 10
#       error_code            = 404
#       response_code         = 200
#       response_page_path    = "/index.html"
#     }
#     ]
#   cache_behavior_default_ttl = 0
#   cache_behavior_max_ttl = 0
#   cache_behavior_viewer_policy = "redirect-to-https"
#   cache_behavior_allowed_methods = ["GET", "HEAD"]
#   cache_behavior_compress = true
#   add_forwarded_value = false
#   cache_policy = var.Managed-CachingOptimized-policy
#   add-origin-access_id = false
#   origin-access_id = null
#   tag = {
#     Environment = var.environment
#     Application = "April Enterprise"
#   }
# }