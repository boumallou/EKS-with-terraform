# module "vpc-staging-europe" {
#   source = "../../modules/network"
#        providers = {
#     aws = aws.Paris
#   }
#   vpc-cidr = "10.0.0.0/16"
#   vpc_name = "Europe-Staging-VPC"
#   prefix = var.prefix_Eu
#   env = var.environemnt
# }
/*==== Internet Gateway ======*/
# /* Internet gateway*/
# resource "aws_internet_gateway" "ig" {
#   vpc_id = "${module.vpc-staging-europe.VPC.id}"
#   tags = {
#     Name        = "${var.environment}-igw"
#     Environment = "${var.environment}"
#   }
# }