data "archive_file" "zip_UexWebsiteRedirection_code" {
type        = "zip"
source_file = "lambda-function/UexWebsiteRedirection.js"
output_path = "lambda-function/UexWebsiteRedirection.zip"
}

module "lambda-UexWebsiteRedirection" {
    source          = "../../modules/lambda"
    File-name       = "lambda-function/UexWebsiteRedirection.zip"
    Function-name   =  "UexWebsiteRedirection"
    IamRoleARN      = "${module.iam_role_access_cloudfront_website.iam_role.arn}"
    Handler         = "index.handler"
    Runtime         = "nodejs16.x"
providers = {
    aws = aws.Virginia
}
}
