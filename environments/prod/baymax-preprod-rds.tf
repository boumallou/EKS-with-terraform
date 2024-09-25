# module "baymax-preprod-rds" {
#   source = "../../modules/rds"
#   providers = {
#     aws = aws.Paris
#   }
#   cluster_name =  "baymax-preproduction-replica-cluster"
#   engine = "aurora-postgresql"
#   engine-mode = "provisioned"
#   engine-version = "11.19"
#   DBName = "baymax_preproduction_eu"
#   master-username = "baymax_eu"
#   master-master-password = var.prod_octnis_db_master_password-eu
#   db_parameter_group = "default.aurora-postgresql11"
#   deletion-protection = false
#   enable-monitoring = false
#   monitoring-interval = 0
#   serverless-instance = false
#   serverless-min-capacity = null
#   serverless-max-capacity = null
#   instance-identifier-writer = "baymax-preproduction-replica"
#   instance-identifier-reader = ["baymax-preproduction-replica-rds"]
#   instance-class-writer = "db.t3.medium"
#   instance-class-reader = ["db.t3.medium"]
#   vpc_SG_ids                 = ["${module.SG-Baymax-RDS-EU.sg_id}"]
#   db-subnet-group-name       = aws_db_subnet_group.rds-subnet-group-preprod-eu.name

# }
# resource "aws_db_subnet_group" "rds-subnet-group-preprod-eu" {
#   name       = "preprod-baymaxpreprod-1029sji1s83om"
#   subnet_ids = ["${module.vpc-Baymax-EU.private_subnets_id[0]}", "${module.vpc-Baymax-EU.private_subnets_id[1]}"]

#   tags = {
#     Name = "baymax-preprod"
#   }
#   provider = aws.Paris
# }