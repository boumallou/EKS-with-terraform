resource "aws_rds_cluster" "dbcluster" {
  cluster_identifier              = var.cluster_name           // "example"
  engine                          = var.engine                 //"aurora-postgresql"
  engine_mode                     = var.engine-mode            //"provisioned"
  engine_version                  = var.engine-version         //"15.4"
  database_name                   = var.DBName                 //"test"
  master_username                 = var.master-username        //"test"
  master_password                 = var.master-master-password //"must_be_eight_characters"
  db_cluster_parameter_group_name = var.db_parameter_group
  deletion_protection             = var.deletion-protection
  copy_tags_to_snapshot           = true
  skip_final_snapshot             = true
  enabled_cloudwatch_logs_exports = ["postgresql"]
  storage_encrypted               = true
  vpc_security_group_ids          = var.vpc_SG_ids
  db_subnet_group_name            = var.db-subnet-group-name

  dynamic "serverlessv2_scaling_configuration" {
    for_each = var.serverless-instance ? [1] : []
    content {
      max_capacity = var.serverless-max-capacity //4
      min_capacity = var.serverless-min-capacity //2
    }

  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_rds_cluster_instance" "writer" {
  cluster_identifier = aws_rds_cluster.dbcluster.id
  // identifier
  instance_class               = var.instance-class-writer //"db.serverless"
  engine                       = aws_rds_cluster.dbcluster.engine
  engine_version               = aws_rds_cluster.dbcluster.engine_version
  performance_insights_enabled = var.enable-monitoring //true
  monitoring_interval          = var.monitoring-interval
  promotion_tier               = 0
  db_subnet_group_name         = var.db-subnet-group-name
}

resource "aws_rds_cluster_instance" "reader" {
  count                        = length(var.instance-identifier-reader) //3
  cluster_identifier           = aws_rds_cluster.dbcluster.id
  identifier                   = var.instance-identifier-reader[count.index]
  instance_class               = var.instance-class-reader[count.index] //"db.serverless"
  engine                       = aws_rds_cluster.dbcluster.engine
  engine_version               = aws_rds_cluster.dbcluster.engine_version
  performance_insights_enabled = var.enable-monitoring // true
  monitoring_interval          = var.monitoring-interval
  promotion_tier               = 1
  db_subnet_group_name         = var.db-subnet-group-name
}
