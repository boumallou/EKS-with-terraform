resource "aws_iam_role" "iam_role" {
  name = var.RoleName

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "attachment1" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
resource "aws_iam_role_policy_attachment" "attachment2" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}
resource "aws_iam_role_policy_attachment" "attachment3" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_policy" "policy" {
  count = var.addInlinePolicy ? 1 : 0
  name        = "inline-policy"
  description = "An inline policy"
  policy = var.policy-document
}
resource "aws_iam_role_policy_attachment" "attach-inline-policy" {
  count      = var.addInlinePolicy ? 1 : 0
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.policy[count.index].arn
}
resource "aws_iam_instance_profile" "instance_profile" {
  name = var.RoleName
  role = aws_iam_role.iam_role.name
}