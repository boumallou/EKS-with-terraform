 module "octnis-prod-redis-eu" {
   source = "../../modules/elasticache"
   providers = {
      aws = aws.Paris
    }
  cluster_name = "octnis-redis-cache"
  description = "octnis-redis-cache"
   Node_type = "cache.r6g.large"
   num_nodes = 3
   subnets = ["${module.vpc-Baymax-EU.private_subnets_id[2]}", "${module.vpc-Baymax-EU.private_subnets_id[3]}", "${module.vpc-Baymax-EU.private_subnets_id[4]}"]
   engine_version = "7.1"
   param_group = "default.redis7"
   multi_az = true
   Auto-failover = true
   encryption_at_rest = true
   encryption_in_transit = false
   vpc_security_group_ids = ["${module.SG-Baymax-Redis-EU.sg_id}"]
 }
