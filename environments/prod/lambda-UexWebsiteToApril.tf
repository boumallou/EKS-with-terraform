data "archive_file" "zip_UexWebsiteToApril_code" {
type        = "zip"
source_file = "lambda-function/UexWebsiteToApril.js"
output_path = "lambda-function/UexWebsiteToApril.zip"
}

module "lambda-UexWebsiteToApril" {
    source          = "../../modules/lambda"
    File-name       = "lambda-function/UexWebsiteToApril.zip"
    Function-name   =  "UexWebsiteToApril"
    IamRoleARN      = "${module.iam_role_access_cloudfront_website.iam_role.arn}"
    Handler         = "index.handler"
    Runtime         = "nodejs14.x"
providers = {
    aws = aws.Virginia
}
}
