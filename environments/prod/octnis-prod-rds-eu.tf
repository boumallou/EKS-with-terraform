# module "octnis-prod-rds-eu" {
#   source = "../../modules/rds"
#   providers = {
#     aws = aws.Paris
#   }
#   cluster_name =  "octnis-production"
#   engine = "aurora-postgresql"
#   engine-mode = "provisioned"
#   engine-version = "15.4"
#   DBName = "octnis_production"
#   master-username = var.prod_octnis_db_master_user_eu //"postgres"
#   master-master-password = var.prod_octnis_db_master_password_eu
#   db_parameter_group = "default.aurora-postgresql15"
#   deletion-protection = true
#   enable-monitoring = true
#   monitoring-interval = 60
#   serverless-instance = true
#   serverless-min-capacity = 2
#   serverless-max-capacity = 4
#   instance-identifier-writer = "octnis-production-instance-1"
#   instance-identifier-reader = ["octnis-production-instance-1-eu-west-3c"]
#   instance-class-writer = "db.serverless"
#   instance-class-reader = ["db.serverless"]
#   vpc_SG_ids                 = ["${module.SG-Baymax-RDS-EU.sg_id}"]
#   db-subnet-group-name       = aws_db_subnet_group.rds-subnet-group-eu.name


# }

# resource "aws_db_subnet_group" "rds-subnet-group-eu" {
#   name       = "production-baymaxprod-s4bcwtlmbcd6"
#   subnet_ids = ["${module.vpc-Baymax-EU.private_subnets_id[2]}", "${module.vpc-Baymax-EU.private_subnets_id[3]}", "${module.vpc-Baymax-EU.private_subnets_id[4]}"]

#   tags = {
#     Name = "baymax-prod"
#   }
#   provider = aws.Paris
# }

module "octnis-prod-rds-eu" {
  source = "../../modules/rds"
  providers = {
    aws = aws.Paris
  }
  cluster_name               = "octnis-prod"
  engine                     = "aurora-postgresql"
  engine-mode                = "provisioned"
  engine-version             = "15.4"
  DBName                     = "octnis_prod"
  master-username            = var.prod_octnis_db_master_user_eu 
  master-master-password     = var.prod_octnis_db_master_password_eu
  db_parameter_group         = "default.aurora-postgresql15"
  deletion-protection        = false
  enable-monitoring          = true
  monitoring-interval        = 0
  serverless-instance        = true
  serverless-min-capacity    = 2
  serverless-max-capacity    = 4
  instance-identifier-writer = "octnis-prod-writer"
  instance-identifier-reader = ["octnis-prod-reader"]
  instance-class-writer      = "db.serverless"
  instance-class-reader      = ["db.serverless"]
  vpc_SG_ids = [
    "${module.SG-Baymax-RDS-EU.sg_id}",
    "${module.octnis-prod-rds-proxy-sg.sg_id}"
  ]
  db-subnet-group-name = aws_db_subnet_group.rds-subnet-group-eu.name

}

resource "aws_db_subnet_group" "rds-subnet-group-eu" {
  name       = "rds-subnet-group"
  subnet_ids = ["${module.vpc-Baymax-EU.private_subnets_id[2]}", "${module.vpc-Baymax-EU.private_subnets_id[3]}", "${module.vpc-Baymax-EU.private_subnets_id[4]}"]

  tags = {
    Name = "rds-subnet-group"
  }
  provider = aws.Paris
}

module "rds_proxy" {
  source = "terraform-aws-modules/rds-proxy/aws"
  providers = {
    aws = aws.Paris
  }
  name           = "octnis-prod-prx"
  iam_role_name  = "octnis-prod-prx-role"
  vpc_subnet_ids = ["${module.vpc-Baymax-EU.private_subnets_id[2]}", "${module.vpc-Baymax-EU.private_subnets_id[3]}", "${module.vpc-Baymax-EU.private_subnets_id[4]}"]

  vpc_security_group_ids = [
    "${module.octnis-prod-rds-proxy-sg.sg_id}"
  ]

  endpoints = {
    read_only = {
      name           = "read-only-endpoint"
      vpc_subnet_ids = ["${module.vpc-Baymax-EU.private_subnets_id[2]}", "${module.vpc-Baymax-EU.private_subnets_id[3]}", "${module.vpc-Baymax-EU.private_subnets_id[4]}"]

      vpc_security_group_ids = [
        "${module.octnis-prod-rds-proxy-sg.sg_id}"
      ]
      target_role = "READ_ONLY"
    }
  }

  auth = {
    "superuser" = {
      description = "Aurora PostgreSQL"
      secret_arn  = "${module.octnis_secrets_rds_proxy-eu.secret_manager_arn}"
    }
  }

  # Target Aurora cluster
  engine_family         = "POSTGRESQL"
  target_db_cluster     = true
  db_cluster_identifier = "octnis-prod"

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}