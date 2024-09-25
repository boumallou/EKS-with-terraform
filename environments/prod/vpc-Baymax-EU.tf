module "vpc-Baymax-EU" {
  source = "../../modules/network"
  providers = {
    aws = aws.Paris
  }
  vpc-cidr = "10.1.0.0/20"
  vpc_name = "EU-Baymax_VPC"
  assign-ipv6_cidr = null
  ipv6-cidr-block = null
  private_subnets = {
      priv-baymax-prod = {
          az = "euw3-az1"
          cidr = "10.1.0.0/24"
          ipv6-cidr = null
          add-eks-tag = var.Octnis_eks_cluster_name-eu
       }
      priv-baymax-preprod = {
          az = "euw3-az1"
          cidr = "10.1.6.0/24"
          ipv6-cidr = null
          add-eks-tag = null
       }
      priv-baymax-prod2 = {
         az = "euw3-az2"
         cidr = "10.1.2.0/24"
         ipv6-cidr = null
         add-eks-tag = var.Octnis_eks_cluster_name-eu
      }
      priv-baymax-preprod2  = {
          az = "euw3-az2"
          cidr = "10.1.8.0/24"
          ipv6-cidr = null
          add-eks-tag = null
       }
      priv-baymax-prod3 = {
          az = "euw3-az3"
          cidr = "10.1.4.0/24"
          ipv6-cidr = null
          add-eks-tag = var.Octnis_eks_cluster_name-eu
       }
      priv-baymax-stg = {
         az = "euw3-az3"
         cidr = "10.1.10.0/24"
         ipv6-cidr = null
         add-eks-tag = null
      }

  }
  public_subnets = {
      pub-baymax-prod = {
          az = "euw3-az1"
          cidr = "10.1.1.0/24"
          ipv6-cidr = null
          map-ip-public = false
       }
      pub-baymax-preprod = {
          az = "euw3-az1"
          cidr = "10.1.7.0/24"
          ipv6-cidr = null
          map-ip-public = false
       }
      pub-baymax-preprod2 = {
         az = "euw3-az2"
         cidr = "10.1.9.0/24"
         ipv6-cidr = null
         map-ip-public = false
      }
      pub-baymax-prod2 = {
          az = "euw3-az2"
          cidr = "10.1.3.0/24"
          ipv6-cidr = null
          map-ip-public = false
       }

      pub-baymax-prod3  = {
          az = "euw3-az3"
          cidr = "10.1.5.0/24"
          ipv6-cidr = null
          map-ip-public = false
       }
      pub-baymax-stg = {
          az = "euw3-az3"
          cidr = "10.1.11.0/24"
          ipv6-cidr = null
          map-ip-public = false
       }
  }

  priv-routes =  [
    {
      cidr-block-type = 0
      cidr = "172.17.0.0/21"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Baymax-EU-EU.id}"
    },
        {
      cidr-block-type = 0
      cidr = "172.16.0.0/22"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Baymax-SG-EU.id}"
    }
  ]
  pub-routes =  [

      {
      cidr-block-type = 0
      cidr = "0.0.0.0/0"
      add_target = 0
      target = "${aws_internet_gateway.ig_Baymax_EU.id}"
    },
    {
      cidr-block-type = 0
      cidr = "172.16.0.0/22"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Baymax-SG-EU.id}"
    },
   {
      cidr-block-type = 0
      cidr = "172.16.4.0/22"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Baymax-SG-EU.id}"
    },
   {
      cidr-block-type = 0
      cidr = "172.17.0.0/21"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Baymax-EU-EU.id}"
    },
  ]
  
  EnableDnsHostname = false
  env = var.environment
}

/*==== Internet Gateway ======*/
resource "aws_internet_gateway" "ig_Baymax_EU" {
  provider = aws.Paris
  vpc_id = "${module.vpc-Baymax-EU.VPC.id}"
  tags = {
    Name        = "Baymax-IGW"
    environment = "${var.environment}"
    application = "baymax"
  }
}