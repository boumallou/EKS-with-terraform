module "octnis-preprod-ec2-sg-eu" {
  providers = {
    aws = aws.Paris
  }
  source         = "../../modules/security-group"
  vpc_id         = module.vpc-preprod-eu.VPC.id
  SG_description = "octnis-EC2-sg"
  SG_name        = "octnis-EC2-sg"
  ingress_rules = [
    {
      from        = 443
      to          = 443
      source      = "${module.vpc-preprod-eu.VPC.cidr_block}"
      protocol    = "tcp"
      add_source  = 0
      description = "From VPC"
    },
    {
      from        = 443
      to          = 443
      source      = "${module.octnis-preprod-alb-sg-eu.sg_id}"
      protocol    = "tcp"
      add_source  = 1
      description = "From ALB"
    }
  ]
  egress_rules = [
    {
      from        = 0
      to          = 0
      source      = "0.0.0.0/0"
      protocol    = "-1"
      add_source  = 0
      description = ""
    }
  ]
  tag = {
    Environment = var.environment
    Application = "Octnis"
    Name        = "octnis-alb-sg"
  }
}
module "octnis-preprod-alb-sg-eu" {
  providers = {
    aws = aws.Paris
  }
  source         = "../../modules/security-group"
  vpc_id         = module.vpc-preprod-eu.VPC.id
  SG_description = "octnis-alb-sg"
  SG_name        = "octnis-alb-sg"
  ingress_rules = [
    {
      from        = 443
      to          = 443
      source      = "0.0.0.0/0"
      protocol    = "tcp"
      add_source  = 0
      description = "From Internet"
    }
  ]
  egress_rules = [
    {
      from        = 0
      to          = 0
      source      = "0.0.0.0/0"
      protocol    = "-1"
      add_source  = 0
      description = ""
    }
  ]
  tag = {
    Environment = var.environment
    Application = "Octnis"
    Name        = "octnis-alb-sg"
  }
}

module "octnis-preprod-redis-sg-eu" {
  source = "../../modules/security-group"
  providers = {
    aws = aws.Paris
  }
  vpc_id         = module.vpc-preprod-eu.VPC.id
  SG_description = "octnis-redis-sg"
  SG_name        = "octnis-redis-sg"
  ingress_rules = [
    {
      from        = 6379
      to          = 6379
      source      = "${module.octnis-preprod-ec2-sg-eu.sg_id}"
      protocol    = "tcp"
      add_source  = 1
      description = "From Octnis Instances"
    },
    {
      from        = 6379
      to          = 6379
      source      = "${module.eks-eu.node_security_group_id}"
      protocol    = "tcp"
      add_source  = 1
      description = "From EKS Nodes"
    }
  ]
  egress_rules = [
    {
      from        = 0
      to          = 0
      source      = "0.0.0.0/0"
      protocol    = "-1"
      add_source  = 0
      description = ""
    }
  ]
  tag = {
    Environment = var.environment
    Application = "Octnis"
    Name        = "octnis-redis-sg"
  }
}

module "octnis-preprod-rds-sg-eu" {
  source = "../../modules/security-group"
  providers = {
    aws = aws.Paris
  }
  vpc_id         = module.vpc-preprod-eu.VPC.id
  SG_description = "octnis-rds-sg"
  SG_name        = "octnis-rds-sg"
  ingress_rules = [
    {
      from        = 5432
      to          = 5432
      source      = "${module.eks-eu.node_security_group_id}"
      protocol    = "tcp"
      add_source  = 1
      description = "From EKS Nodes"
    },
    {
      from        = 5432
      to          = 5432
      source      = "${module.octnis-preprod-rds-proxy-sg.sg_id}"
      protocol    = "tcp"
      add_source  = 1
      description = "From RDS Proxy"
    }
  ]
  egress_rules = [
    {
      from        = 0
      to          = 0
      source      = "0.0.0.0/0"
      protocol    = "-1"
      add_source  = 0
      description = ""
    }
  ]
  tag = {
    Environment = var.environment
    Application = "Octnis"
    Name        = "octnis-rds-sg"
  }
}

module "octnis-preprod-rds-proxy-sg" {
  source         = "../../modules/security-group"
  providers = {
    aws = aws.Paris
  }
  vpc_id         = module.vpc-preprod-eu.VPC.id
  SG_description = "octnis-rds-proxy-sg"
  SG_name        = "octnis-rds-proxy-sg"
  ingress_rules = [
    {
      from        = 5432
      to          = 5432
      source      = "${module.eks-eu.node_security_group_id}"
      protocol    = "tcp"
      add_source  = 1
      description = "From EKS Nodes"
    }
  ]
  egress_rules = [
    {
      from        = 0
      to          = 0
      source      = "0.0.0.0/0"
      protocol    = "-1"
      add_source  = 0
      description = ""
    }
  ]
  tag = {
    Environment = var.environment
    Application = "Octnis"
    Name        = "octnis-rds-proxy-sg"
  }
}
