
module "bucket-baymax-logs-production-euw3" {
  source = "../../modules/s3"
        providers = {
    aws = aws.Paris
  }
  s3_bucket-name = var.bucketnames[43]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = true
  RestrictPublicBuckets = true
  BlockPublicAcls = true
  IgnorePublicAcls = true
  isProd = true
  addPolicy = false
  bucket-policy =  jsonencode("")
  tag = {
    Environment = var.environment
    Name = var.bucketnames[43]
    Application = "baymax"
  }
}
