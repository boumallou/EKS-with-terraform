
# module "bucket-uexglobal_com" {
#   source = "../../modules/s3"
#   s3_bucket-name = var.bucketnames[41]
#   s3_bucket-versioning = "Disabled"
#   BlockPublicPolicy = true
#   RestrictPublicBuckets = true
#   BlockPublicAcls = true
#   IgnorePublicAcls = true
#   isProd = true
#   addPolicy = true
#   bucket-policy =  data.aws_iam_policy_document.bucket-policy-uexglobal_com.json
#   tag = {
#     Environment = var.environment
#     Name = var.bucketnames[41]
#     Application = "uexglobal"
#   }
# }
# data "aws_iam_policy_document" "bucket-policy-uexglobal_com" {
# statement {
#     sid = "PublicReadGetObject"
#     effect    = "Allow"
#     principals {
#       type = "*"
#       identifiers = ["*"]
#     }
#     actions = [
#         "s3:GetObject",
#     ]
#     resources = [
#         "arn:aws:s3:::${var.bucketnames[41]}/*",
#     ]
#   }

#   statement {
#     sid       = "2"
#     actions    = [
#         "s3:GetObject"
#     ]
#     effect    = "Allow"
#     principals {
#         type = "AWS"
#         identifiers = ["${aws_cloudfront_origin_access_identity.oai.iam_arn}"]
#     }
#     resources  = [
#         "arn:aws:s3:::${var.bucketnames[41]}/*",
#     ]
    
#   }
# }
# #CFD = Cloudfront Distribution
# module "CFD-bucket-uexglobal_com" {
#   source = "../../modules/cloudfront"
#   S3OriginId = "S3-${var.bucketnames[41]}"
#   Description = "UEX Website Production"
#   IPV6_Enabled = true
#   Alias = [var.bucketnames[41],"www.uexglobal.com"]
#   Bucket-domain-name = "${module.bucket-uexglobal_com.bucket-domain-name}"
#   lambda = "${module.lambda-UexWebsiteToApril.lambda_arn}"
#   lambda_event_type = "viewer-request"
#   certificat_arn = var.uexglobal_com_certificat_arn
#   tls_protocol_version = "TLSv1.2_2018"
#   ssl_method = "sni-only"
#   add_edge_function = true
#   CFD_error_response = [
#     #response1
#     {
#       error_caching_min_ttl = 60
#       error_code            = 403
#       response_code         = 200
#       response_page_path    = "/index.html"
#     }
#   ]
#    cache_behavior_default_ttl = 86400
#    cache_behavior_max_ttl = 31536000
#    cache_behavior_viewer_policy = "redirect-to-https"
#    cache_behavior_allowed_methods = ["GET", "HEAD"]
#    cache_behavior_compress = true
#    add_forwarded_value = true
#    cache_policy = null
#    add-origin-access_id = false
#    origin-access_id = null
#    origin-access_control = null
#    default_certificat = false
#    tag = {
#     Environment = var.environment
#     Application = "UEX Website"
#   }

# }

