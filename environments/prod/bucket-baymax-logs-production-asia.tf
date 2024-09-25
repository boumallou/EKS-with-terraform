
module "bucket-baymax-logs-production-asia" {
  source = "../../modules/s3"
  s3_bucket-name = var.bucketnames[42]
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
    Name = var.bucketnames[42]
    Application = "baymax"
  }
}