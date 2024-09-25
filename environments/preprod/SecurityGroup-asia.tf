module "octnis-preprod-ec2-sg" {
  source         = "../../modules/security-group"
  vpc_id         = module.vpc-preprod-asia.VPC.id
  SG_description = "octnis-EC2-sg"
  SG_name        = "octnis-EC2-sg"
  ingress_rules = [
    {
      from        = 443
      to          = 443
      source      = "${module.vpc-preprod-asia.VPC.cidr_block}"
      protocol    = "tcp"
      add_source  = 0
      description = "From VPC"
    },
    {
      from        = 443
      to          = 443
      source      = "${module.octnis-preprod-alb-sg.sg_id}"
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
module "octnis-preprod-alb-sg" {
  source         = "../../modules/security-group"
  vpc_id         = module.vpc-preprod-asia.VPC.id
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

# module "octnis-preprod-redis-sg" {
#   source = "../../modules/security-group"
#   vpc_id = "${module.vpc-preprod-asia.VPC.id}"
#   SG_description = "octnis-redis-sg"
#   SG_name = "octnis-redis-sg"
#   ingress_rules =  [
#      {
#        from             = 6379
#        to               = 6379
#        source           = "${module.octnis-preprod-ec2-sg.sg_id}"
#        protocol         = "tcp"
#        add_source       = 1
#        description      = "From Octnis Instances"
#      }]
#     #   {
#     #    from             = 6379
#     #    to               = 6379
#     #    source           = "${module.eks.node_security_group_id}"
#     #    protocol         = "tcp"
#     #    add_source       = 1
#     #    description      = "From EKS Nodes"
#     #  }
#     #  ]
#   tag = {
#   Environment = var.environment
#   Application = "Octnis"
#   Name = "octnis-redis-sg"
#   }
# }

# module "octnis-preprod-rds-sg" {
#   source = "../../modules/security-group"
#   vpc_id = "${module.vpc-preprod-asia.VPC.id}"
#   SG_description = "octnis-rds-sg"
#   SG_name = "octnis-rds-sg"
#    ingress_rules =  []
#   #     {
#   #      from             = 5432
#   #      to               = 5432
#   #      source           = "${module.eks.node_security_group_id}"
#   #      protocol         = "tcp"
#   #      add_source       = 1
#   #      description      = "From EKS Nodes"
#   #    }
#   #  ]
#   tag = {
#   Environment = var.environment
#   Application = "Octnis"
#   Name = "octnis-rds-sg"
#   }
# }
