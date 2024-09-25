

# #CFD = Cloudfront Distribution
# module "CFD-healthhub_uexglobal_com" {
#   source = "../../modules/cloudfront"
#   S3OriginId = "S3-healthhub.uexglobal.com"
#   Description = "Marketplace Production"
#   IPV6_Enabled = true
#   Alias = ["healthhub.uexglobal.com"]
#   Bucket-domain-name = "healthhub.uexglobal.com.s3.amazonaws.com"
#   lambda = "${module.lambda-UexWebsiteRedirection.lambda_arn}"
#   lambda_event_type = "viewer-request"
#   certificat_arn = var.uexglobal_com_certificat_arn
#   tls_protocol_version = "TLSv1.1_2016"
#   ssl_method = "sni-only"
#   add_edge_function = true
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
#     Application = "Marketplace"
#   }

# }

