

module "bucket-staging-baymax-deployment-asia_uexglobal_com" {
  source = "../../modules/s3"
  s3_bucket-name = var.bucketnames[44]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = true
  RestrictPublicBuckets = true
  BlockPublicAcls = true
  IgnorePublicAcls = true
  isProd = false
  addPolicy = false
  bucket-policy =  jsonencode("")
  tag = {
    Environment = var.environment
    Name = var.bucketnames[44]
    Application = "baymax"
  }
}
