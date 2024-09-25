resource "aws_cloudfront_distribution" "s3_distribution" {
  enabled = true
  aliases = var.Alias
  comment = var.Description
  is_ipv6_enabled = var.IPV6_Enabled
  default_root_object = "index.html"
  tags = var.tag
dynamic custom_error_response {
  for_each = var.CFD_error_response
  content {
    error_caching_min_ttl = custom_error_response.value.error_caching_min_ttl
    error_code            = custom_error_response.value.error_code
    response_code         = custom_error_response.value.response_code
    response_page_path    = custom_error_response.value.response_page_path
  }
}

  default_cache_behavior {
    default_ttl            = var.cache_behavior_default_ttl //86400
    max_ttl                = var.cache_behavior_max_ttl //31536000
    viewer_protocol_policy = var.cache_behavior_viewer_policy //"redirect-to-https"
    allowed_methods  = var.cache_behavior_allowed_methods //["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    compress = var.cache_behavior_compress // false default
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.S3OriginId
    dynamic lambda_function_association {
      for_each = var.add_edge_function ? [1] : []
      content {
              event_type   = var.lambda_event_type // "viewer-request"
              include_body = false
              lambda_arn   = var.lambda //"arn:aws:lambda:us-east-1:194235606604:function:MyAprilRedirectionPython:5"
               }
        }
    dynamic forwarded_values {
      for_each = var.add_forwarded_value ? [1] : []
      content {
            query_string = false
            cookies {
              forward = "none"
                    }
             }
     }
     cache_policy_id = var.cache_policy
  
  }


######
origin {
  connection_attempts      = 3
  connection_timeout       = 10
  domain_name              = var.Bucket-domain-name
  origin_access_control_id = var.origin-access_control
	origin_id                = var.S3OriginId
  dynamic s3_origin_config {
    for_each = var.add-origin-access_id ? [1] : []
    content {
       origin_access_identity = var.origin-access_id //"origin-access-identity/cloudfront/E3V7D1MZLPI9C4"
    }
  }
 
  }

     restrictions {
     geo_restriction {
       restriction_type = "none"
       locations        = []
     }
   }

viewer_certificate {
  acm_certificate_arn            = var.certificat_arn // "arn:aws:acm:us-east-1:194235606604:certificate/bbb9eedd-46fd-45f0-855a-98c4f7e789a5"
  cloudfront_default_certificate = var.default_certificat // false
  minimum_protocol_version       = var.tls_protocol_version //"TLSv1.2_2019"
  ssl_support_method             = var.ssl_method //"sni-only"
        }
 }