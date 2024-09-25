data "archive_file" "zip_UexRedirectionAprilSG_code" {
type        = "zip"
source_file = "lambda-function/UexRedirectionAprilSG.js"
output_path = "lambda-function/UexRedirectionAprilSG.zip"
}

module "lambda-UexRedirectionAprilSG" {
    source          = "../../modules/lambda"
    File-name       = "lambda-function/UexRedirectionAprilSG.zip"
    Function-name   =  "UexRedirectionAprilSG"
    IamRoleARN      = "${module.iam_role_access_cloudfront_website.iam_role.arn}"
    Handler         = "index.handler"
    Runtime         = "nodejs14.x"
providers = {
    aws = aws.Virginia
}
}
