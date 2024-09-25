module "SG-AdminTools" {
  source = "../../modules/security-group"
  providers = {
    aws = aws.Paris
  }
  vpc_id = "${module.vpc-Admin-EU.VPC.id}"
  SG_description = "For Grafana and Log Servers usage"
  SG_name = "AdminTools"
  ingress_rules =  [
     {
       from             = 443
       to               = 443
       source           = "0.0.0.0/0"
       protocol         = "tcp"
       add_source       = 0
       description      = ""
     },
     {
       from             = 24224
       to               = 24224
       source           = "10.1.0.0/20"
       protocol         = "tcp"
       add_source       = 0
       description      = "VPC Baymax Fluentd"
     },
     {
       from             = 22
       to               = 22
       source           = "172.16.0.0/21"
       protocol         = "tcp"
       add_source       = 0
       description      = "Access SSH from Bastion subnets"
     }
     ]
    egress_rules =  [
     {
       from             = 0
       to               = 0
       source           = "0.0.0.0/0"
       protocol         = "-1"
       add_source       = 0
       description      = ""
     }
     ]
  tag = {
    Environment = var.environment
    Application = "Admin Tools"
    Name = "AdminTools EU"
  }
}

module "SG-Baymax-Backend-EU" {
  source = "../../modules/security-group"
  providers = {
    aws = aws.Paris
  }
  vpc_id = "${module.vpc-Baymax-EU.VPC.id}"
  SG_description = "Security Group for Baymax BackEnd"
  SG_name = "Baymax Backend SG"
  ingress_rules =  [
     {
       from             = 80
       to               = 80
       source           = "0.0.0.0/0"
       protocol         = "tcp"
       add_source       = 0
       description      = "All inbound HTTP connections"
     },
     {
       from             = 22
       to               = 22
       source           = "172.16.0.0/21"
       protocol         = "tcp"
       add_source       = 0
       description       = "SSH Connections from Admin VPC"
     }, 
     {
       from             = 22
       to               = 22
       source           = "172.16.0.0/22"
       protocol         = "tcp"
       add_source       = 0
       description      = "SSH Connections from Admin VPC"
     },
     {
       from             = 443
       to               = 443
       source           = "0.0.0.0/0"
       protocol         = "tcp"
       add_source       = 0
       description       = "All inbound HTTPS connections"
     }              
     ]
    egress_rules =  [
     {
       from             = 443
       to               = 443
       source           = "0.0.0.0/0"
       protocol         = "tcp"
       add_source       = 0
       description      = "For package update"
     },
      {
       from             = 80
       to               = 80
       source           = "0.0.0.0/0"
       protocol         = "tcp"
       add_source       = 0
       description      = "For package update"
     },
      {
       from             = 24224
       to               = 24224
       source           = "172.17.4.192/32"
       protocol         = "tcp"
       add_source       = 0
       description      = "Fluentd"
     },
      {
       from             = 5432
       to               = 5432
       source           = "sg-03f40a19ef5ebc63e"
       protocol         = "tcp"
       add_source       = 1
       description      = "Access to DB"
     },
      {
       from             = 6379
       to               = 6379
       source           = "sg-0c15857cfe7aa3765"
       protocol         = "tcp"
       add_source       = 1
       description      = "Access to Redis"
     }

     ]
  tag = {
    Environment = var.environment
    Name        = "Baymax Backend EU"
    Application = "baymax" 
  }
}

module "SG-Baymax-RDS-EU" {
  source = "../../modules/security-group"
  providers = {
    aws = aws.Paris
  }
  vpc_id = "${module.vpc-Baymax-EU.VPC.id}"
  SG_description = "Security Group for Baymax RDS"
  SG_name = "Baymax RDS SG"
  ingress_rules =  [
     {
       from             = 5432
       to               = 5432
       source           = "sg-0e6d4f33e8dae541a"
       protocol         = "tcp"
       add_source       = 1
       description       = "Access for Backend Servers"
     },
     {
       from             = 5432
       to               = 5432
       source           = "172.17.4.0/24"
       protocol         = "tcp"
       add_source       = 0
       description       = "Access for Admin Tools 3a"
     },
     {
       from             = 5432
       to               = 5432
       source           = "172.17.1.0/24"
       protocol         = "tcp"
       add_source       = 0
       description       = "Access for Admin Tools 3b"
     }
     ]
egress_rules =  [
     {
       from             = 0
       to               = 0
       source           = "0.0.0.0/0"
       protocol         = "-1"
       add_source       = 0
       description      = ""
     }
     ]
tag = {
    Environment = var.environment
    Application = "Baymax"
    Name = "Baymax RDS EU"
  }
}

module "SG-Baymax-Redis-EU" {
  source = "../../modules/security-group"
  providers = {
    aws = aws.Paris
  }
  vpc_id = "${module.vpc-Baymax-EU.VPC.id}"
  SG_description = "Security Group for Baymax Redis"
  SG_name = "Baymax Redis SG"
  ingress_rules =  [
     {
       from             = 6379
       to               = 6379
       source           = "172.17.4.0/24"
       protocol         = "tcp"
       add_source       = 0
       description       = "Access for Admin Tools"
     },
      {
       from             = 6379
       to               = 6379
       source           = "sg-0e6d4f33e8dae541a"
       protocol         = "tcp"
       add_source       = 1
       description       = "Access for Backend Servers"
     },
     {
       from             = 6379
       to               = 6379
       source           = "172.17.1.0/24"
       protocol         = "tcp"
       add_source       = 0
       description      = "Access for Admin Tools"
     }            
     ]
egress_rules =  [
     {
       from             = 0
       to               = 0
       source           = "0.0.0.0/0"
       protocol         = "-1"
       add_source       = 0
       description      = ""
     }
     ]
tag = {
    Environment = var.environment
    Application = "Baymax"
    Name = "Baymax Redis EU"
  }
}
module "octnis-prod-rds-proxy-sg" {
  source         = "../../modules/security-group"
  providers = {
    aws = aws.Paris
  }
  vpc_id         = "${module.vpc-Baymax-EU.VPC.id}"
  SG_description = "octnis-rds-proxy-sg"
  SG_name        = "octnis-rds-proxy-sg"
  ingress_rules = [
    {
      from        = 5432
      to          = 5432
      source      = "sg-0e6d4f33e8dae541a" //"${module.eks-eu.node_security_group_id}"
      protocol    = "tcp"
      add_source  = 1
      description = "From EKS Nodes"
    }
  ]
egress_rules =  [
     {
       from             = 0
       to               = 0
       source           = "0.0.0.0/0"
       protocol         = "-1"
       add_source       = 0
       description      = ""
     }
     ]
  tag = {
    Environment = var.environment
    Application = "Octnis"
    Name        = "octnis-rds-proxy-sg"
  }
}
