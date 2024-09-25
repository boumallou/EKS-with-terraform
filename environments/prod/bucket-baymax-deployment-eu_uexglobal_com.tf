
module "bucket-baymax-deployment-eu_uexglobal_com" {
  source = "../../modules/s3"
           providers = {
    aws = aws.Paris
  }
  s3_bucket-name = var.bucketnames[45]
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
    Name = var.bucketnames[45]
    Application = "baymax"
  }
}
