module "vpc-Baymax-asia" {
  source = "../../modules/network"
  vpc-cidr = "10.0.0.0/16"
  vpc_name = "ASIA-Baymax_VPC"
  assign-ipv6_cidr = null
  ipv6-cidr-block = "2406:da18:7a:b00::/56"
  private_subnets = {
      priv-baymax-preprod-1b = {
          az = "apse1-az1"
          cidr = "10.0.4.0/24"
          ipv6-cidr = "2406:da18:7a:b04::/64"
          add-eks-tag = null
       }
      priv-baymax-preprod-1c = {
          az = "apse1-az3"
          cidr = "10.0.5.0/24"
          ipv6-cidr = "2406:da18:7a:b05::/64"
          add-eks-tag = null
       }
      priv-baymax-prod-1a = {
         az = "apse1-az2"
         cidr = "10.0.9.0/24"
         ipv6-cidr = null
         add-eks-tag = var.Octnis_eks_cluster_name
      }
      priv-baymax-prod-1b = {
          az = "apse1-az1"
          cidr = "10.0.3.0/24"
          ipv6-cidr = "2406:da18:7a:b03::/64"
          add-eks-tag = var.Octnis_eks_cluster_name
       }
      priv-baymax-prod-1c = {
          az = "apse1-az3"
          cidr = "10.0.1.0/24"
          ipv6-cidr = "2406:da18:7a:b01::/64"
          add-eks-tag = var.Octnis_eks_cluster_name
       }
      priv-baymax-stg-1a = {
         az = "apse1-az2"
         cidr = "10.0.10.0/24"
         ipv6-cidr = null
         add-eks-tag = null
      }
      priv-baymax-stg-1b = {
          az = "apse1-az1"
          cidr = "10.0.14.0/24"
          ipv6-cidr = null
          add-eks-tag = null
       }
  }
  public_subnets = {
      pub-baymax-preprod-1b = {
          az = "apse1-az1"
          cidr = "10.0.11.0/24"
          ipv6-cidr = null
          map-ip-public = false
       }
      pub-baymax-preprod-1c = {
          az = "apse1-az1"
          cidr = "10.0.12.0/24"
          ipv6-cidr = null
          map-ip-public = false
       }
      pub-baymax-prod-1a = {
         az = "apse1-az2"
         cidr = "10.0.8.0/24"
         ipv6-cidr = null
         map-ip-public = false
      }
      pub-baymax-prod-1b = {
          az = "apse1-az1"
          cidr = "10.0.0.0/24"
          ipv6-cidr = "2406:da18:7a:b00::/64"
          map-ip-public = false
       }

       pub-baymax-prod-1c = {
          az = "apse1-az3"
          cidr = "10.0.2.0/24"
          ipv6-cidr = "2406:da18:7a:b02::/64"
          map-ip-public = false
       }
      pub-baymax-stg = {
          az = "apse1-az2"
          cidr = "10.0.13.0/24"
          ipv6-cidr = null
          map-ip-public = false
       }
  }

  priv-routes =  [
    #   {
    #   cidr-block-type = 1
    #   cidr = "2406:da18:7a:b00::/56"
    #   add_target = 0
    #   target = "local"
    # },
    #   {
    #   cidr-block-type = 0
    #   cidr = "10.0.0.0/16"
    #   add_target = 0
    #   target = "local"
    # },
    {
      cidr-block-type = 0
      cidr = "172.16.0.0/21"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Baymax-SG-SG.id}"
    }
  ]
  pub-routes =  [
  #  {
  #     cidr-block-type = 1
  #     cidr = "2406:da18:7a:b00::/56"
  #     add_target = 0
  #     target = "local"
  #   },
      {
      cidr-block-type = 0
      cidr = "0.0.0.0/0"
      add_target = 0
      target = "${aws_internet_gateway.ig_Baymax_Asie.id}"
    },
    #    {
    #   cidr-block-type = 0
    #   cidr = "10.0.0.0/16"
    #   add_target = 0
    #   target = "local"
    # },
    {
      cidr-block-type = 0
      cidr = "172.16.0.0/21"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Baymax-SG-SG.id}"
    }
  ]
  
  EnableDnsHostname = true
  env = var.environment
}

/*==== Internet Gateway ======*/
resource "aws_internet_gateway" "ig_Baymax_Asie" {

  vpc_id = "${module.vpc-Baymax-asia.VPC.id}"
  tags = {
    Name        = "baymax-gw"
    Environment = "${var.environment}"
  }
}