module "vpc-Admin-asia" {
  source = "../../modules/network"
  vpc-cidr = "172.16.0.0/21"
  vpc_name = "Asia-Admin-VPC"
  assign-ipv6_cidr = null
  ipv6-cidr-block = null
  public_subnets = {
      Admin-1c = {
         az = "apse1-az3"
         cidr = "172.16.4.0/24"
         ipv6-cidr = null
         map-ip-public = true
      }
      Bastion-1a = {
         az = "apse1-az2"
         cidr = "172.16.0.0/24"
         ipv6-cidr = null
         map-ip-public = true
      }
      Bastion-1b = {
          az = "apse1-az1"
          cidr = "172.16.1.0/24"
          ipv6-cidr = null
          map-ip-public = true
       }
      Bastion-1c = {
          az = "apse1-az3"
          cidr = "172.16.2.0/24"
          ipv6-cidr = null
          map-ip-public = true
       }

}
  private_subnets = {}
  EnableDnsHostname = false
  env = var.environment
  priv-routes =  []
  pub-routes = [
    {
      cidr-block-type = 0
      cidr = "0.0.0.0/0"
      add_target = 0
      target = "${aws_internet_gateway.ig_Admin_Asie.id}"
    },
     {
      cidr-block-type = 0
      cidr = "10.0.0.0/16"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Baymax-SG-SG.id}"
    },
    {
      cidr-block-type = 0
      cidr = "10.1.0.0/20"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Baymax-SG-EU.id}"
    },
      {
      cidr-block-type = 0
      cidr = "172.17.0.0/21"
      add_target = 2
      target = "${aws_vpc_peering_connection.Admin-Asia-EU.id}"
    }
  ]
}

/*==== Internet Gateway ======*/


resource "aws_internet_gateway" "ig_Admin_Asie" {
  vpc_id = "${module.vpc-Admin-asia.VPC.id}"
  tags = {
    Name        = "Asia-admin-gw"
    Environment = "${var.environment}"
  }
}


resource "aws_vpc_peering_connection" "Admin-Asia-EU" {
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"
  peer_vpc_id   = "vpc-088230b3c4b4035a1" // Import VPC from Europe region
  vpc_id        = "${module.vpc-Admin-asia.VPC.id}"
  tags = {
    Name = "Admin-Asia-EU"
    }
}
resource "aws_vpc_peering_connection" "Admin-Baymax-SG-EU" {
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"
  peer_vpc_id   = "${module.vpc-Admin-asia.VPC.id}" // Import VPC from Europe region
  vpc_id        = "vpc-0aec843e89242503b" // Import VPC from Europe region
  tags = {
    Name = "Admin-Baymax-SG-EU"
    }
}
resource "aws_vpc_peering_connection" "Admin-Baymax-SG-SG" {
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"
  peer_vpc_id   = "${module.vpc-Baymax-asia.VPC.id}"
  vpc_id        = "${module.vpc-Admin-asia.VPC.id}"
  tags = {
    Name = "Admin-Baymax-SG-SG"
    }
}