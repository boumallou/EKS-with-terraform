resource "aws_iam_role" "iam_role" {
  name                  = var.RoleName
  description           = "Allows Lambda functions to call AWS services on your behalf."
  tags = {
  "access-cloudfront" = "all-cloudfront"
}
  assume_role_policy    = <<EOF
{
 "Version": "2012-10-17",
 "Statement": 
 [
   {
     "Effect": "Allow",
     "Action": "sts:AssumeRole",
     "Principal": 
            {
                "Service": 
                [
                    "lambda.amazonaws.com",
                    "edgelambda.amazonaws.com"
                ]
            }
   }
 ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "attachment1" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"
}