module "Admin-NACL" {
  source = "../../modules/nacl/default"
  default-nacl-id = "${module.vpc-Admin-asia.VPC.default_network_acl_id}" //  "acl-099c22b3e609aacfc" 
  subnetID = ["${module.vpc-Admin-asia.public_subnets_id[0]}"]
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
    Name        = "Admin-NACL"
    Role = "Monitoring"
  }
}
# module "BaymaxDefaultNacl" {
#   source = "../../modules/nacl/default"
#   default-nacl-id = "${module.vpc-Admin-asia.VPC.default_network_acl_id}" //  "acl-099c22b3e609aacfc" 
#   subnetID = ["${module.vpc-Baymax-asia.private_subnets_id[6]}"]
#   nacl_ingress_rule = []
#   nacl_egress_rule =  []

#   tag = {
#     Environment = var.environment
#     Name        = "BaymaxDefaultNacl"
#     Role = "Baymax"
#   }
# }

module "BaymaxStgPriv" {
  source = "../../modules/nacl/nodefault"
  vpcId = "${module.vpc-Baymax-asia.VPC.id}"
  subnetID = ["${module.vpc-Baymax-asia.private_subnets_id[5]}"]
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
    cidr-block = "172.16.4.0/22"
    from-port = 5432
    to-port = 5432
     },
    {
    protocol = "tcp"
    rule-number = 300
    rule-action = "allow"
    cidr-block = "172.16.4.0/22"
    from-port = 6379
    to-port = 6379
     },
    {
    protocol = "tcp"
    rule-number = 400
    rule-action = "allow"
    cidr-block = "10.0.13.0/24"
    from-port = 5432
    to-port = 5432
     },
    {
    protocol = "tcp"
    rule-number = 500
    rule-action = "allow"
    cidr-block = "10.0.13.0/24"
    from-port = 6379
    to-port = 6379
     },
    {
    protocol = "tcp"
    rule-number = 600
    rule-action = "deny"
    cidr-block = "0.0.0.0/0"
    from-port = 22
    to-port = 22
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
    Name        = "BaymaxStgPriv"
    Role = "Baymax"
  }
}

module "Bastion-NACL" {
  source = "../../modules/nacl/nodefault"
  vpcId = "${module.vpc-Admin-asia.VPC.id}"
  subnetID = ["${module.vpc-Admin-asia.public_subnets_id[1]}","${module.vpc-Admin-asia.public_subnets_id[2]}","${module.vpc-Admin-asia.public_subnets_id[3]}"]
  nacl_ingress_rule =  [
     {
    protocol = "tcp"
    rule-number = 100
    rule-action = "deny"
    cidr-block = "10.0.0.0/16"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 101
    rule-action = "deny"
    cidr-block = "10.1.0.0/16"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 200
    rule-action = "deny"
    cidr-block = "172.16.4.0/22"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 201
    rule-action = "deny"
    cidr-block = "172.17.4.0/22"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 300
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 400
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
    Name        = "Bastion-NACL"
    Role = "bastion"
  }
}
module "BaymaxPreprodPriv" {
  source = "../../modules/nacl/nodefault"
  vpcId = "${module.vpc-Baymax-asia.VPC.id}"
  subnetID = ["${module.vpc-Baymax-asia.private_subnets_id[0]}","${module.vpc-Baymax-asia.private_subnets_id[1]}"]
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
    cidr-block = "172.16.4.0/22"
    from-port = 5432
    to-port = 5432
     },
    {
    protocol = "tcp"
    rule-number = 300
    rule-action = "allow"
    cidr-block = "172.16.4.0/22"
    from-port = 6379
    to-port = 6379
     },
    {
    protocol = "tcp"
    rule-number = 400
    rule-action = "allow"
    cidr-block = "10.0.11.0/24"
    from-port = 5432
    to-port = 5432
     },
         {
    protocol = "tcp"
    rule-number = 401
    rule-action = "allow"
    cidr-block = "10.0.12.0/24"
    from-port = 5432
    to-port = 5432
     },
    {
    protocol = "tcp"
    rule-number = 500
    rule-action = "allow"
    cidr-block = "10.0.11.0/24"
    from-port = 6379
    to-port = 6379
     },
    {
    protocol = "tcp"
    rule-number = 501
    rule-action = "allow"
    cidr-block = "10.0.12.0/24"
    from-port = 6379
    to-port = 6379
     },
    {
    protocol = "tcp"
    rule-number = 600
    rule-action = "deny"
    cidr-block = "0.0.0.0/0"
    from-port = 22
    to-port = 22
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
    Name        = "BaymaxPreprodPriv"
    Role = "Baymax"
  }
}

module "BaymaxProdPriv" {
  source = "../../modules/nacl/nodefault"
  vpcId = "${module.vpc-Baymax-asia.VPC.id}"
  subnetID = ["${module.vpc-Baymax-asia.private_subnets_id[2]}","${module.vpc-Baymax-asia.private_subnets_id[3]}","${module.vpc-Baymax-asia.private_subnets_id[4]}"]
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
    rule-number = 150
    rule-action = "deny"
    cidr-block = "0.0.0.0/0"
    from-port = 22
    to-port = 22
     },
    {
    protocol = "tcp"
    rule-number = 200
    rule-action = "allow"
    cidr-block = "172.16.4.0/22"
    from-port = 5432
    to-port = 5432
     },
    {
    protocol = "tcp"
    rule-number = 300
    rule-action = "allow"
    cidr-block = "172.16.4.0/22"
    from-port = 6379
    to-port = 6379
     },
         {
    protocol = "tcp"
    rule-number = 400
    rule-action = "allow"
    cidr-block = "10.0.0.0/24"
    from-port = 5432
    to-port = 5432
     },
    {
    protocol = "tcp"
    rule-number = 401
    rule-action = "allow"
    cidr-block = "10.0.2.0/24"
    from-port = 5432
    to-port = 5432
     },
    {
    protocol = "tcp"
    rule-number = 402
    rule-action = "allow"
    cidr-block = "10.0.8.0/24"
    from-port = 5432
    to-port = 5432
     },
    {
    protocol = "tcp"
    rule-number = 500
    rule-action = "allow"
    cidr-block = "10.0.0.0/24"
    from-port = 6379
    to-port = 6379
     },
    {
    protocol = "tcp"
    rule-number = 501
    rule-action = "allow"
    cidr-block = "10.0.2.0/24"
    from-port = 6379
    to-port = 6379
     },
    {
    protocol = "tcp"
    rule-number = 502
    rule-action = "allow"
    cidr-block = "10.0.8.0/24"
    from-port = 6379
    to-port = 6379
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
    Name        = "BaymaxProdPriv"
    Role = "Baymax"
  }
}
module "BaymaxProdPub" {
  source = "../../modules/nacl/nodefault"
  vpcId = "${module.vpc-Baymax-asia.VPC.id}"
  subnetID = ["${module.vpc-Baymax-asia.public_subnets_id[2]}","${module.vpc-Baymax-asia.public_subnets_id[3]}","${module.vpc-Baymax-asia.public_subnets_id[4]}"]
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
    rule-number = 101
    rule-action = "allow"
    cidr-block = "172.16.4.0/22"
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
    rule-number = 350
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 80
    to-port = 80
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
    Name        = "BaymaxProdPub"
    Role = "Baymax"
  }
}
module "BaymaxPreprodPub" {
  source = "../../modules/nacl/nodefault"
  vpcId = "${module.vpc-Baymax-asia.VPC.id}"
  subnetID = ["${module.vpc-Baymax-asia.public_subnets_id[0]}","${module.vpc-Baymax-asia.public_subnets_id[1]}"]
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
    rule-number = 101
    rule-action = "allow"
    cidr-block = "172.16.4.0/22"
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
    Name        = "BaymaxPreprodPub"
    Role = "Baymax"
  }
}

module "BaymaxStgPub" {
  source = "../../modules/nacl/nodefault"
  vpcId = "${module.vpc-Baymax-asia.VPC.id}"
  subnetID = ["${module.vpc-Baymax-asia.public_subnets_id[5]}"]
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
    rule-number = 101
    rule-action = "allow"
    cidr-block = "172.16.4.0/22"
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
    rule-number = 500
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 1024
    to-port = 65535
     },
    {
    protocol = "tcp"
    rule-number = 550
    rule-action = "allow"
    cidr-block = "0.0.0.0/0"
    from-port = 80
    to-port = 80
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
    Name        = "BaymaxStgPub"
    Role = "Baymax"
  }
}