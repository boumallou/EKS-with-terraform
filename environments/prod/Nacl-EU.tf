module "Admin-NACL-EU" {
  source = "../../modules/nacl/default"
  providers = {
    aws = aws.Paris
  }
  default-nacl-id = "${module.vpc-Admin-EU.VPC.default_network_acl_id}" //  "acl-099c22b3e609aacfc" 
  subnetID = ["${module.vpc-Admin-EU.public_subnets_id[0]}","${module.vpc-Admin-EU.public_subnets_id[1]}"]
  nacl_ingress_rule =  [
     {
    protocol = "tcp"
    rule-number = 100
    rule-action = "allow"
    cidr-block = "172.16.0.0/22"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 200
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 443
    to-port = 443
     },
     {
    protocol = "tcp"
    rule-number = 500
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 1024
    to-port = 65535
     }

     ]
   nacl_egress_rule =  [
     {
    protocol = -1
    rule-number = 100
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 0
    to-port = 0
     }
     ]

  tag = {
    Environment = var.environment
    Name        = "Admin NACL"
    Role = "Monitoring"
  }
}


# module "BaymaxPreprodPriv-EU" {
#   source = "../../modules/nacl/nodefault"
#   providers = {
#     aws = aws.Paris
#   }
#   vpcId = "${module.vpc-Baymax-EU.VPC.id}"
#   subnetID = ["${module.vpc-Baymax-EU.private_subnets_id[0]}","${module.vpc-Baymax-EU.private_subnets_id[1]}"]
#   nacl_ingress_rule =  [
#      {
#     protocol = "tcp"
#     rule-number = 100
#     rule-action = "allow"
#     cidr-block = "172.16.0.0/22"
#     from-port = 22
#     to-port = 22
#      },
#     {
#     protocol = "tcp"
#     rule-number = 200
#     rule-action = "allow"
#     cidr-block = "172.16.4.0/22"
#     from-port = 5432
#     to-port = 5432
#      },
#     {
#     protocol = "tcp"
#     rule-number = 300
#     rule-action = "allow"
#     cidr-block = "172.16.4.0/22"
#     from-port = 6379
#     to-port = 6379
#      },
#     {
#     protocol = "tcp"
#     rule-number = 400
#     rule-action = "allow"
#     cidr-block = "10.1.7.0/24"
#     from-port = 5432
#     to-port = 5432
#      },
#     {
#     protocol = "tcp"
#     rule-number = 401
#     rule-action = "allow"
#     cidr-block = "10.1.9.0/24"
#     from-port = 5432
#     to-port = 5432
#      },
#     {
#     protocol = "tcp"
#     rule-number = 500
#     rule-action = "allow"
#     cidr-block = "10.1.7.0/24"
#     from-port = 6379
#     to-port = 6379
#      },
#      {
#     protocol = "tcp"
#     rule-number = 501
#     rule-action = "allow"
#     cidr-block = "10.1.9.0/24"
#     from-port = 6379
#     to-port = 6379
#      },
#      {
#     protocol = "tcp"
#     rule-number = 600
#     rule-action = "deny"
#     cidr-block = "0.0.0.0/0"
#     from-port = 6379
#     to-port = 6379
#      }

#      ]
#    nacl_egress_rule =  [
#      {
#     protocol = -1
#     rule-number = 100
#     rule-action = "allow"
#     cidr-block = "0.0.0.0/0"
#     from-port = 0
#     to-port = 0
#      }
#      ]

#   tag = {
#     Environment = var.environment
#     Name        = "BaymaxPreprodPriv"
#     Role = "Baymax"
#   }
# }

module "BaymaxPreprodPub-EU" {
  source = "../../modules/nacl/nodefault"
  providers = {
    aws = aws.Paris
  }
  vpcId = "${module.vpc-Baymax-EU.VPC.id}"
  subnetID = ["${module.vpc-Baymax-EU.public_subnets_id[0]}","${module.vpc-Baymax-EU.public_subnets_id[1]}"]
  nacl_ingress_rule =  [
     {
    protocol = "tcp"
    rule-number = 100
    rule-action = "allow"
    cidr-block = "172.16.0.0/21"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 200
    rule-action = "deny"
    cidr-block = "0.0.0.0/0"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 300
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 443
    to-port = 443
     },
    {
    protocol = "tcp"
    rule-number = 400
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 1024
    to-port = 65535
     }
     ]
   nacl_egress_rule =  [
     {
    protocol = -1
    rule-number = 100
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 0
    to-port = 0
     }
     ]

  tag = {
    Environment = var.environment
    Name        = "BaymaxPreprodPub"
    Role = "Baymax"
  }
}

module "BaymaxProdPub-EU" {
  source = "../../modules/nacl/nodefault"
  providers = {
    aws = aws.Paris
  }
  vpcId = "${module.vpc-Baymax-EU.VPC.id}"
  subnetID = ["${module.vpc-Baymax-EU.public_subnets_id[2]}","${module.vpc-Baymax-EU.public_subnets_id[3]}","${module.vpc-Baymax-EU.public_subnets_id[4]}"]
  nacl_ingress_rule =  [
     {
    protocol = "tcp"
    rule-number = 100
    rule-action = "allow"
    cidr-block = "172.16.0.0/21"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 200
    rule-action = "deny"
    cidr-block = "0.0.0.0/0"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 300
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 443
    to-port = 443
     },
    {
    protocol = "tcp"
    rule-number = 400
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 1024
    to-port = 65535
     }
     ]
   nacl_egress_rule =  [
     {
    protocol = -1
    rule-number = 100
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 0
    to-port = 0
     }
     ]

  tag = {
    Environment = var.environment
    Name        = "BaymaxProdPub"
    Role = "Baymax"
  }
}

# module "BaymaxProdPriv-EU" {
#   source = "../../modules/nacl/nodefault"
#   providers = {
#     aws = aws.Paris
#   }
#   vpcId = "${module.vpc-Baymax-EU.VPC.id}"
#   subnetID = ["${module.vpc-Baymax-EU.private_subnets_id[2]}","${module.vpc-Baymax-EU.private_subnets_id[3]}","${module.vpc-Baymax-EU.private_subnets_id[4]}"]
#   nacl_ingress_rule =  [
#      {
#     protocol = "tcp"
#     rule-number = 100
#     rule-action = "allow"
#     cidr-block = "172.16.0.0/22"
#     from-port = 22
#     to-port = 22
#      },
#     {
#     protocol = "tcp"
#     rule-number = 200
#     rule-action = "allow"
#     cidr-block = "172.16.4.0/22"
#     from-port = 5432
#     to-port = 5432
#      },
#     {
#     protocol = "tcp"
#     rule-number = 300
#     rule-action = "allow"
#     cidr-block = "172.16.4.0/22"
#     from-port = 6379
#     to-port = 6379
#      },
#     {
#     protocol = "tcp"
#     rule-number = 400
#     rule-action = "allow"
#     cidr-block = "10.1.1.0/24"
#     from-port = 5432
#     to-port = 5432
#      },
#     {
#     protocol = "tcp"
#     rule-number = 401
#     rule-action = "allow"
#     cidr-block = "10.1.3.0/24"
#     from-port = 5432
#     to-port = 5432
#      },
#     {
#     protocol = "tcp"
#     rule-number = 402
#     rule-action = "allow"
#     cidr-block = "10.1.5.0/24"
#     from-port = 5432
#     to-port = 5432
#      },
#     {
#     protocol = "tcp"
#     rule-number = 500
#     rule-action = "allow"
#     cidr-block = "10.1.1.0/24"
#     from-port = 6379
#     to-port = 6379
#      },
#     {
#     protocol = "tcp"
#     rule-number = 501
#     rule-action = "allow"
#     cidr-block = "10.1.3.0/24"
#     from-port = 6379
#     to-port = 6379
#      },
#     {
#     protocol = "tcp"
#     rule-number = 502
#     rule-action = "allow"
#     cidr-block = "10.1.5.0/24"
#     from-port = 6379
#     to-port = 6379
#      },
#     {
#     protocol = "tcp"
#     rule-number = 600
#     rule-action = "allow"
#     cidr-block = "0.0.0.0/0"
#     from-port = 22
#     to-port = 22
#      }
#      ]
#    nacl_egress_rule =  [
#      {
#     protocol = -1
#     rule-number = 100
#     rule-action = "allow"
#     cidr-block = "0.0.0.0/0"
#     from-port = 0
#     to-port = 0
#      }
#      ]

#   tag = {
#     Environment = var.environment
#     Name        = "BaymaxProdPriv"
#     Role = "Baymax"
#   }
# }