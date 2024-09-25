# module "octnis-preprod-rds" {
#   source                     = "../../modules/rds"
#   cluster_name               = "octnis-preprod"
#   engine                     = "aurora-postgresql"
#   engine-mode                = "provisioned"
#   engine-version             = "15.4"
#   DBName                     = "octnis_preprod"
#   master-username            = var.preprod_octnis_db_master_user
#   master-master-password     = var.preprod_octnis_db_master_password
#   db_parameter_group         = "default.aurora-postgresql15"
#   deletion-protection        = false
#   enable-monitoring          = false
#   monitoring-interval        = 0
#   serverless-instance        = true
#   serverless-min-capacity    = 0.5
#   serverless-max-capacity    = 1
#   instance-identifier-writer = "octnis-preprod-writer"
#   instance-identifier-reader = []
#   instance-class-writer      = "db.serverless"
#   instance-class-reader      = ["db.serverless"]
#   vpc_SG_ids                 = ["${module.octnis-preprod-rds-sg.sg_id}"]
#   db-subnet-group-name       = aws_db_subnet_group.rds-subnet-group.name

# }

# resource "aws_db_subnet_group" "rds-subnet-group" {
#   name       = "rds-subnet-group"
#   subnet_ids = ["${module.vpc-preprod-asia.private_subnets_id[2]}", "${module.vpc-preprod-asia.private_subnets_id[3]}"]

#   tags = {
#     Name = "rds-subnet-group"
#   }
# }
