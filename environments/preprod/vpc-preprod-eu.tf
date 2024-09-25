module "vpc-preprod-eu" {
  source = "../../modules/network"
   providers = {
     aws = aws.Paris
   }
  vpc-cidr = "10.0.0.0/16"
  vpc_name = "Eu-preprod-VPC"
  assign-ipv6_cidr = null
  ipv6-cidr-block = null
  public_subnets = {
      pub-app-subnet-1 = {
         az = "euw3-az1"
         cidr = "10.0.19.0/24"
         ipv6-cidr = null
         map-ip-public = true
      }
      pub-app-subnet-2 = {
          az = "euw3-az2"
          cidr = "10.0.20.0/24"
          ipv6-cidr = null
          map-ip-public = true
       }
      # pub-app-subnet-3 = {
      #    az = "euw3-az3"
      #    cidr = "10.0.21.0/24"
      # }
}
  private_subnets = {
      priv-app-subnet-1 = {
         az = "euw3-az1"
         cidr = "10.0.22.0/24"
         ipv6-cidr = null
         add-eks-tag = var.Octnis_eks_cluster_name-eu
      }
      priv-app-subnet-2 = {
         az = "euw3-az2"
         cidr = "10.0.23.0/24"
         ipv6-cidr = null
         add-eks-tag = var.Octnis_eks_cluster_name-eu
      }
      # priv-app-subnet-3 = {
      #    az = "euw3-az3"
      #    cidr = "10.0.24.0/24"
      # }
      priv-data-subnet-1 = {
         az = "euw3-az1"
         cidr = "10.0.25.0/24"
         ipv6-cidr = null
         add-eks-tag = null
      }
     priv-data-subnet-2 = {
        az = "euw3-az2"
        cidr = "10.0.26.0/24"
        ipv6-cidr = null
        add-eks-tag = null
     }
      # priv-data-subnet-3 = {
      #    az = "euw3-az3"
      #    cidr = "10.0.27.0/24"
      # }
}
  EnableDnsHostname = true
  env = var.environment
  pub-routes = [
         {
       cidr-block-type = 0
       cidr = "0.0.0.0/0"
       add_target = 0
       target = "${aws_internet_gateway.ig_preprod_eu.id}"
     }
  ]
  priv-routes = [
            {
      cidr-block-type = 0
      cidr = "0.0.0.0/0"
      add_target = 1
      target = "${aws_nat_gateway.nat_gateway_eu.id}"
    }
  ]
}

/* EIP for Nat Gateway */
resource "aws_eip" "nat_gateway_IP_eu" {
  domain = "vpc"
  tags = {
    Name        = "nat_gateway_IP_eu"
    Environment = "${var.environment}"
  }
  provider = aws.Paris
}

/* NAT GATEWAY in the first public subnet*/
resource "aws_nat_gateway" "nat_gateway_eu" {
  allocation_id = aws_eip.nat_gateway_IP_eu.id
  subnet_id = "${module.vpc-preprod-eu.public_subnets_id[0]}"
  tags = {
    Name        = "${var.environment}-nat-gateway"
    Environment = "${var.environment}"
  }
  provider = aws.Paris
}

/*==== Internet Gateway ======*/
 resource "aws_internet_gateway" "ig_preprod_eu" {
   vpc_id = "${module.vpc-preprod-eu.VPC.id}"
   tags = {
     Name        = "${var.environment}-igw"
     Environment = "${var.environment}"
   }
  provider = aws.Paris
 }
