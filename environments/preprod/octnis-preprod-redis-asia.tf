# module "octnis-preprod-redis" {
#   source = "../../modules/elasticache"
#   cluster_name = "octnis-redis-cache"
#   description = "octnis-redis-cache"
#   Node_type = "cache.t2.micro"
#   num_nodes = 2
#   subnets = ["${module.vpc-preprod-asia.private_subnets_id[2]}"]
#   engine_version = "7.0"
#   param_group = "default.redis7"
#   multi_az = false
#   Auto-failover = false
#   encryption_at_rest = true
#   encryption_in_transit = false
#   vpc_security_group_ids = ["${module.octnis-preprod-redis-sg.sg_id}"]
# }