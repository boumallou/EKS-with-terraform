module "vpc-preprod-asia" {
  source = "../../modules/network"
  vpc-cidr = "10.0.0.0/16"
  vpc_name = "Asia-preprod-VPC"
  assign-ipv6_cidr = null
  ipv6-cidr-block = null
  public_subnets = {
      pub-app-subnet-1 = {
         az = "apse1-az1"
         cidr = "10.0.10.0/24"
         ipv6-cidr = null
         map-ip-public = true
      }
      pub-app-subnet-2 = {
          az = "apse1-az2"
          cidr = "10.0.11.0/24"
          ipv6-cidr = null
          map-ip-public = true
       }
      # pub-app-subnet-3 = {
      #    az = "apse1-az3"
      #    cidr = "10.0.12.0/24"
      # }
}
  private_subnets = {
      priv-app-subnet-1 = {
         az = "apse1-az1"
         cidr = "10.0.13.0/24"
         ipv6-cidr = null
         add-eks-tag = var.Octnis_eks_cluster_name
      }
      priv-app-subnet-2 = {
         az = "apse1-az2"
         cidr = "10.0.14.0/24"
         ipv6-cidr = null
         add-eks-tag = var.Octnis_eks_cluster_name
      }
      # priv-app-subnet-3 = {
      #    az = "apse1-az3"
      #    cidr = "10.0.15.0/24"
      # }
      priv-data-subnet-1 = {
         az = "apse1-az1"
         cidr = "10.0.16.0/24"
         ipv6-cidr = null
         add-eks-tag = null
      }
     priv-data-subnet-2 = {
        az = "apse1-az2"
        cidr = "10.0.17.0/24"
        ipv6-cidr = null
        add-eks-tag = null
     }
      # priv-data-subnet-3 = {
      #    az = "apse1-az3"
      #    cidr = "10.0.18.0/24"
      # }
}
  EnableDnsHostname = true
  env = var.environment
  pub-routes = [
         {
       cidr-block-type = 0
       cidr = "0.0.0.0/0"
       add_target = 0
       target = "${aws_internet_gateway.ig_preprod_asia.id}"
     }
  ]
  priv-routes = [
            {
      cidr-block-type = 0
      cidr = "0.0.0.0/0"
      add_target = 1
      target = "${aws_nat_gateway.nat_gateway.id}"
    }
  ]
}

/* EIP for Nat Gateway */
resource "aws_eip" "nat_gateway_IP" {
  domain = "vpc"
  tags = {
    Name        = "nat_gateway_IP"
    Environment = "${var.environment}"
  }
}

/* NAT GATEWAY in the first public subnet*/
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_IP.id
  subnet_id = "${module.vpc-preprod-asia.public_subnets_id[0]}"
  tags = {
    Name        = "${var.environment}-nat-gateway"
    Environment = "${var.environment}"
  }
}

/*==== Internet Gateway ======*/
 resource "aws_internet_gateway" "ig_preprod_asia" {
   vpc_id = "${module.vpc-preprod-asia.VPC.id}"
   tags = {
     Name        = "${var.environment}-igw"
     Environment = "${var.environment}"
   }
 }
