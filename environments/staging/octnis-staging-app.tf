
# data "aws_ami" "ami" {
#   most_recent      = true
#     filter {
#     name   = "name"
#     values = ["Octnis-*"]
#   }
# }

# module "octnis_staging_instance_profile"{
#   source = "../../modules/iam-policy/iam-instance-profile"
#   RoleName = "${var.octnis_app_name}-InstanceProfile"
#   addInlinePolicy = true
#   policy-document = data.aws_iam_policy_document.policy.json
# }

# module "octnis-staging-app-alb" {
#   source = "../../modules/alb"
#   app_name = "${var.octnis_app_name}"
#   env = var.environment
#   vpc_security_group_ids = ["${module.octnis-staging-ec2-sg.sg_id}"]
#   subnets = "${module.vpc-staging-asia.public_subnets_id.*}"
#   target_group_name = "${var.octnis_app_name}-targetGroup"
#   vpc_id = "${module.vpc-staging-asia.VPC.id}"
#   certificat_arn = var.octnis_certificat_arn
# }

# module "octnis-staging-app-asg" {
#   source = "../../modules/asg"
#   prefix = var.octnis_app_name
#   instance_size = var.octnis_instance_size
#   key_name = var.octnis_key_name
#   env = var.environment
#   sg_id = "${module.octnis-staging-ec2-sg.sg_id}"
#   image_id = data.aws_ami.ami.id
#   alb_id = "${module.octnis-staging-app-alb.ALB.id}"
#   subnets = ["${module.vpc-staging-asia.private_subnets_id[0]}"]
#   target_group_arn = "${module.octnis-staging-app-alb.TG-ARN}"
#   UserData = "${file("octnis_user-data.sh")}"
#   InstanceProfile = "${module.octnis_staging_instance_profile.instance_profile_name}"
# }


# data "aws_iam_policy_document" "policy" {
#   statement {
#     effect    = "Allow"
#     actions   = [
#       "s3:PutObject",
#       "s3:ListBucket"
#       ]
#     resources = [
#       "arn:aws:s3:::${var.bucketnames[51]}",
#       "arn:aws:s3:::${var.bucketnames[51]}"
#     ]
#   }
# }

