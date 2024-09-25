
# Bucket name
variable "s3_bucket-name" {
  type = string
}

# s3_bucket-versioning
variable "s3_bucket-versioning" {
  type = string
}

# bucket-policy
variable "bucket-policy" {
  type = string
}

#BlockPublicPolicy
variable "BlockPublicPolicy" {
  type = bool
}

#RestrictPublicBuckets
variable "RestrictPublicBuckets" {
  type = bool
}
#BlockPublicAcls
variable "BlockPublicAcls" {
  type = bool
}
#IgnorePublicAcls
variable "IgnorePublicAcls" {
  type = bool
}

#isProd
variable "isProd" {
  type = bool
}

#addPolicy
variable "addPolicy" {
  type = bool
}
variable "tag" {
    type = object({
      Environment = string
      Name        = string
      Application = string
    })
}