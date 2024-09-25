module "SG-Bastion" {
  source = "../../modules/security-group"
  vpc_id = "${module.vpc-Admin-asia.VPC.id}"
  SG_description = "Security Group for Bastion"
  SG_name = "SG-Bastion"
  ingress_rules =  [
     {
       from             = 22
       to               = 22
       source           = "${aws_ec2_managed_prefix_list.Bastion-User-UEX.id}"
       protocol         = "tcp"
       add_source       = 2
       description      = "From Prefix list Bastion User"
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
    Application = "Admin"
    Name = "Admin Bastion"
  }
}

module "Admin-Tools-SG" {
  source = "../../modules/security-group"
  vpc_id = "${module.vpc-Admin-asia.VPC.id}"
  SG_description = "Security Group for Admin tools (monitoring, business dashboard)"
  SG_name = "Admin Tools"
  ingress_rules =  [
     {
       from             = 80
       to               = 80
       source           = "0.0.0.0/0"
       protocol         = "tcp"
       add_source       = 0
       description      = ""
     },  
     {
       from             = 443
       to               = 443
       source           = "0.0.0.0/0"
       protocol         = "tcp"
       add_source       = 0
       description      = ""
     },
     {
       from             = 22
       to               = 22
       source           = "${module.SG-Bastion.sg_id}"
       protocol         = "tcp"
       add_source       = 1
       description       = "Administration via Bastion"
     },
     {
       from             = 24224
       to               = 24224
       source           = "10.0.0.0/16"
       protocol         = "tcp"
       add_source       = 0
       description       = "VPC Baymax Fluentd"
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
    Application = "Admin"
    Name        = "Admin Tools"
  }
}

module "Jenkins-slave-SG" {
  source = "../../modules/security-group"
  vpc_id = "${module.vpc-Admin-asia.VPC.id}"
  SG_description = "Allow connections from Jenkins master"
  SG_name = "Jenkins-slave-SG"
  ingress_rules =  [
     {
       from             = 4243
       to               = 4243
       source           = "${module.Admin-Tools-SG.sg_id}"
       protocol         = "tcp"
       add_source       = 1
       description       = "Docker Remote API"
     },
         {
       from             = 32768
       to               = 60999
       source           = "${module.Admin-Tools-SG.sg_id}"
       protocol         = "tcp"
       add_source       = 1
       description       = "Docker Hostport Range"
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
    Application = "UEX Website"
    Name = "Jenkins-slave-SG"
  }

}

module "Baymax-BackEnd-SG" {
  source = "../../modules/security-group"
  vpc_id = "${module.vpc-Baymax-asia.VPC.id}"
  SG_description = "Security Group for Baymax BackEnd"
  SG_name = "Baymax-BackEnd"
  ingress_rules =  [
     {
       from             = 443
       to               = 443
       source           = "0.0.0.0/0"
       protocol         = "tcp"
       add_source       = 0
       description       = "Access to API"
     },
      {
       from             = 9100
       to               = 9100
       source           = "${module.Admin-Tools-SG.sg_id}"
       protocol         = "tcp"
       add_source       = 1
       description       = "Prometheus scan"
     },
     {
       from             = 22
       to               = 22
       source           = "172.16.4.0/22"
       protocol         = "tcp"
       add_source       = 0
       description      = "Administration by Bastion"

     },
     {
       from             = 22
       to               = 22
       source           = "172.16.0.0/22"
       protocol         = "tcp"
       add_source       = 0
       description      = "Administration by Bastion"
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
       from             = 9443
       to               = 9443
       source           = "103.63.133.22/32"
       protocol         = "tcp"
       add_source       = 0
       description      = "APRIL Mega Production"
     },
      {
       from             = 28080
       to               = 28080
       source           = "103.63.133.22/32"
       protocol         = "tcp"
       add_source       = 0
       description      = "APRIL Mega UAT"
     },
      {
       from             = 24224
       to               = 24224
       source           = "172.16.4.75/32"
       protocol         = "tcp"
       add_source       = 0
       description      = "Fluentd"
     },
      {
       from             = 5432
       to               = 5432
       source           = "sg-04cd2221945f5f1d9"
       protocol         = "tcp"
       add_source       = 1
       description      = "Access to DB"
     },
      {
       from             = 6379
       to               = 6379
       source           = "sg-023ab4344c257ffb1"
       protocol         = "tcp"
       add_source       = 1
       description      = "Access to Redis"
     }

     ]
tag = {
    Environment = var.environment
    Application = "Baymax"
    Name = "Baymax-BackEnd"
  }
}

module "Baymax-RDS-SG" {
  source = "../../modules/security-group"
  vpc_id = "${module.vpc-Baymax-asia.VPC.id}"
  SG_description = "Security Group for Baymax RDS"
  SG_name = "Baymax-RDS"
  ingress_rules =  [
     {
       from             = 5432
       to               = 5432
       source           = "172.16.4.0/22"
       protocol         = "tcp"
       add_source       = 0
       description       = "Access for Admin Tools"
     },
         {
       from             = 5432
       to               = 5432
       source           = "sg-02caa37e1f06c2c2b"
       protocol         = "tcp"
       add_source       = 1
       description       = "Access for BackEnd servers"
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
    Name = "Baymax-RDS"
  }
}

module "Baymax-Redis-SG" {
  source = "../../modules/security-group"
  vpc_id = "${module.vpc-Baymax-asia.VPC.id}"
  SG_description = "Security Group for Baymax Redis"
  SG_name = "Baymax-Redis"
  ingress_rules =  [
     {
       from             = 6379
       to               = 6379
       source           = "172.16.4.0/22"
       protocol         = "tcp"
       add_source       = 0
       description       = "Access for Admin Tools"
     },
         {
       from             = 6379
       to               = 6379
       source           = "sg-02caa37e1f06c2c2b"
       protocol         = "tcp"
       add_source       = 1
       description       = "Access for BackEnd servers"
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
    Name = "Baymax-Redis"
  }
}

module "baymax-prod-SG" {
  source = "../../modules/security-group"
  vpc_id = "${module.vpc-Baymax-asia.VPC.id}"
  SG_description = "baymax-prod"
  SG_name = "baymax-prod"
  ingress_rules =  [
     {
       from             = 443
       to               = 443
       source           = "0.0.0.0/0"
       protocol         = "tcp"
       add_source       = 0
       description       = ""
     },
         {
       from             = 22
       to               = 22
       source           = "172.16.0.0/21"
       protocol         = "tcp"
       add_source       = 0
       description       = "Admin VPC Access"
     },
         {
       from             = 80
       to               = 80
       source           = "0.0.0.0/0"
       protocol         = "tcp"
       add_source       = 0
       description       = ""
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
    Application = "Website"
    Name        = "website-production"
  }
}