module "octnis-staging-rds" {
  source                     = "../../modules/rds"
  cluster_name               = "octnis-staging"
  engine                     = "aurora-postgresql"
  engine-mode                = "provisioned"
  engine-version             = "15.4"
  DBName                     = "octnis_staging"
  master-username            = var.staging_octnis_db_master_user
  master-master-password     = var.staging_octnis_db_master_password
  db_parameter_group         = "default.aurora-postgresql15"
  deletion-protection        = true
  enable-monitoring          = false
  monitoring-interval        = 0
  serverless-instance        = true
  serverless-min-capacity    = 0.5
  serverless-max-capacity    = 4
  instance-identifier-writer = "octnis-staging-writer"
  instance-identifier-reader = []
  instance-class-writer      = "db.serverless"
  instance-class-reader      = ["db.serverless"]
  vpc_SG_ids = [
    "${module.octnis-staging-rds-sg.sg_id}",
    "${module.octnis-staging-rds-proxy-sg.sg_id}"
  ]
  db-subnet-group-name = aws_db_subnet_group.rds-subnet-group.name

}

resource "aws_db_subnet_group" "rds-subnet-group" {
  name       = "rds-subnet-group"
  subnet_ids = ["${module.vpc-staging-asia.private_subnets_id[2]}", "${module.vpc-staging-asia.private_subnets_id[3]}"]

  tags = {
    Name = "rds-subnet-group"
  }
}

module "rds_proxy" {
  source = "terraform-aws-modules/rds-proxy/aws"

  name           = "octnis-staging-prx"
  iam_role_name  = "octnis-staging-prx-role"
  vpc_subnet_ids = ["${module.vpc-staging-asia.private_subnets_id[2]}", "${module.vpc-staging-asia.private_subnets_id[3]}"]

  vpc_security_group_ids = [
    "${module.octnis-staging-rds-proxy-sg.sg_id}"
  ]

  endpoints = {
    read_only = {
      name           = "read-only-endpoint"
      vpc_subnet_ids = ["${module.vpc-staging-asia.private_subnets_id[2]}", "${module.vpc-staging-asia.private_subnets_id[3]}"]

      vpc_security_group_ids = [
        "${module.octnis-staging-rds-proxy-sg.sg_id}"
      ]
      target_role = "READ_ONLY"
    }
  }

  auth = {
    "superuser" = {
      description = "Aurora PostgreSQL"
      secret_arn  = "${module.octnis_secrets_rds_proxy.secret_manager_arn}"
    }
  }

  # Target Aurora cluster
  engine_family         = "POSTGRESQL"
  target_db_cluster     = true
  db_cluster_identifier = "octnis-staging"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
