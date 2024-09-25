resource "aws_elasticache_replication_group" "redis_cluster" {
  replication_group_id = var.cluster_name //"octnis-redis-cache"
  description          = var.description //"octnis-redis-cache"
  node_type            = var.Node_type //"cache.t2.micro"
  num_cache_clusters   = var.num_nodes //2
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.subnet_group.name
  security_group_ids   = var.vpc_security_group_ids //["sg-035a8261efc323dd0"]
  parameter_group_name = var.param_group //"default.redis7"
  engine_version       = var.engine_version //"7.1"
  transit_encryption_enabled = var.encryption_in_transit //false
  at_rest_encryption_enabled = var.encryption_at_rest //false
  multi_az_enabled = var.multi_az
  automatic_failover_enabled = var.Auto-failover
 
}

resource "aws_elasticache_subnet_group" "subnet_group" {
  name       = "${var.cluster_name}-subnet-group"
  subnet_ids = var.subnets
}
