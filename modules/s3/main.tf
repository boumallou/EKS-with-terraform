resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket-name
  tags = var.tag
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.s3_bucket-versioning
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}
resource "aws_s3_bucket_policy" "bucketpolicy" {
  count = var.addPolicy ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  policy = var.bucket-policy
}
resource "aws_s3_bucket_public_access_block" "access" {
  count = var.isProd ? 0 : 1
  bucket = aws_s3_bucket.bucket.id
  restrict_public_buckets = var.RestrictPublicBuckets
  block_public_policy     = var.BlockPublicPolicy
  block_public_acls       = var.BlockPublicAcls
  ignore_public_acls      = var.IgnorePublicAcls
}
