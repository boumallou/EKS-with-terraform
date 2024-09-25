
module "bucket-euw3_docs_uexglobal_com" {
  source = "../../modules/s3"
      providers = {
    aws = aws.Paris
  }
  s3_bucket-name = var.bucketnames[40]
  s3_bucket-versioning = "Disabled"
  BlockPublicPolicy = false
  RestrictPublicBuckets = true
  BlockPublicAcls = true
  IgnorePublicAcls = true
  isProd = true
  addPolicy = false
  bucket-policy =  jsonencode("")
  tag = {
    Environment = var.environment
    Name = var.bucketnames[40]
    Application = "docs"
  }
}
