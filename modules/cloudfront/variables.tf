
# Alias
variable "Alias" {
  type = list(string)
}
# Description
variable "Description" {
  type = string
}
# IPV6_Enabled
variable "IPV6_Enabled" {
  type = bool
}

# OriginId
variable "S3OriginId" {
  type = string
}

#Bucket-domain-name
variable "Bucket-domain-name" {
  type = string
}

#lambda_ARN
variable "lambda" {
  type = string
}

#certificat_arn
variable "certificat_arn" {
  type = string
}
#tls_protocol_version
variable "tls_protocol_version" {
  type = string
}
#ssl_method
variable "ssl_method" {
  type = string
}
variable "add_edge_function" {
  type = bool
}
variable "CFD_error_response" {
  type = list(object({
    error_caching_min_ttl = number
    error_code  = number
    response_code = number
    response_page_path = string
  }))
}
variable "cache_behavior_default_ttl" {
  type = string
} 
variable "cache_behavior_max_ttl" {
  type = string
}
variable "cache_behavior_viewer_policy" {
  type = string
}
variable "cache_behavior_allowed_methods" {
  type = list(string)
}
variable "cache_behavior_compress" {
  type = bool
}
variable "add_forwarded_value" {
  type = bool
}
variable "cache_policy" {
  type = string
}
variable "add-origin-access_id" {
  type = bool
}
variable "origin-access_control" {
  type = string
}
variable "origin-access_id" {
  type = string
}
variable "lambda_event_type" {
  type = string
}
variable "default_certificat" {
  type = bool
}
variable "tag" {
    type = object({
      Environment = string
      Application = string
    })
}