resource "aws_lambda_function" "function" {
filename                       = var.File-name //"lambda-function/MyAprilRedirectionPython.zip"
function_name                  = var.Function-name //"MyAprilRedirectionPython"
role                           = var.IamRoleARN //"${module.iam-role-access-cloudfront-website.iam_role.arn}"
handler                        = var.Handler //"index.lambda_handler"
runtime                        = var.Runtime //"python3.12"
//providers = {
//    aws = aws.Paris
//}
//depends_on                     = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}