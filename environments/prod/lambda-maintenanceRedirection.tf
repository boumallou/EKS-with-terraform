data "archive_file" "zip_maintenanceRedirection_code" {
type        = "zip"
source_file = "lambda-function/maintenanceRedirection.js"
output_path = "lambda-function/maintenanceRedirection.zip"
}

module "lambda-maintenanceRedirection" {
    source          = "../../modules/lambda"
    File-name       = "lambda-function/maintenanceRedirection.zip"
    Function-name   =  "maintenanceRedirection"
    IamRoleARN      = "${module.iam_role_access_cloudfront_website.iam_role.arn}"
    Handler         = "index.handler"
    Runtime         = "nodejs14.x"
providers = {
    aws = aws.Virginia
}
}
