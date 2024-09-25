
module "bucket-ssh-private-keys" {
  source = "../../modules/s3"
  s3_bucket-name = var.bucketnames[50]
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
    Name = var.bucketnames[50]
    Application = "ssh"
  }
}
