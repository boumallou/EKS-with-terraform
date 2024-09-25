data "archive_file" "zip_MyAprilRedirectionPython_code" {
type        = "zip"
source_file = "lambda-function/MyAprilRedirectionPython.py"
output_path = "lambda-function/MyAprilRedirectionPython.zip"
}

module "lambda-MyAprilRedirectionPython" {
    source          = "../../modules/lambda"
    File-name       = "lambda-function/MyAprilRedirectionPython.zip"
    Function-name   =  "MyAprilRedirectionPython"
    IamRoleARN      = "${module.iam_role_access_cloudfront_website.iam_role.arn}"
    Handler         = "lambda_function.lambda_handler"
    Runtime         = "python3.12"
providers = {
    aws = aws.Virginia
}
}
