

module "bucket-staging-euw3_docs_uexglobal_com" {
  source = "../../modules/s3"
      providers = {
    aws = aws.Paris
  }
  s3_bucket-name = var.bucketnames[40]
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
    Name = var.bucketnames[40]
    Application = "docs"
  }
}
